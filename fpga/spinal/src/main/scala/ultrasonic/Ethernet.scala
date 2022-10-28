package ultrasonic

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._
import spinal.crypto.checksum._

import java.lang._
import mylib._


/**
 *
 * @param sender
 * @param receiver
 * @param inDataWidth
 * @param outDataWidth
 * @param txDatalen
 *
 * rmii_rx0-->|-------------|<---Tx_DATA[inDataWidth]
 * rmii_rx1-->|             |--------------
 * rmii_rxen->|  ethernet   |--------------
 * rmii_tx0<--|   Module    |--------------
 * rmii_tx1<--|             |--------------
 * rmii_txv<--|-------------|--->Rx_DATA[outDataWidth]
 */

object EthernetProtocol {
  val PREAMBLE = 0x55
  val FRAMESTART = 0xd5
  val USERTYPE = 0x0900
  val CONFIGSTART = 0x0A00
  val CONFIGFINISH = 0x0B00
}

case class EthernetConfig( val sender:String = "fa:23:aa:60:10:6f",
                           val receiver:String = "11:22:33:44:55:66",
                           val preambleData:String= "55_55_55_55_55_55_55_d5",
                           val txType: Int = EthernetProtocol.USERTYPE,
                           val inDataWidth:Int = 16,
                           val outDataWidth:Int = 16,
                           val curDatalen:Int = 46,
                         )



class RMII_Ethernet(config:EthernetConfig) extends Component {
  assert(config.outDataWidth%8==0 && config.inDataWidth%8==0,"Ethernet in/out Width should be the pow of 2!")

  val io = new Bundle {
    val rmii_rx = in Bits(2 bits)
    val rmii_rxen = in Bool()
    val rmii_tx = out Bits(2 bits)
    val rmii_txv = out Bool()

    val rx_data = master Stream(Bits(config.outDataWidth bits))
    val fe_flag = out Bool()

    val tx_data = slave Stream(Bits(config.inDataWidth bits))
    val tx_flag = in Bool()

    val frame_send = in Bool()
    val frame_receive = in Bool()

  }

  val rx = new RMII_RX(config)

  val tx = new RMII_TX(config)

  io.rmii_rx <> rx.io.rmii_rx
  io.rmii_rxen <> rx.io.rmii_rxen

  io.rx_data <> rx.io.rx_data
  io.tx_data <> tx.io.tx_data

  io.tx_flag <> tx.io.tx_flag
  io.fe_flag <> rx.io.fe_flag

  io.rmii_tx <> tx.io.rmii_tx
  io.rmii_txv <> tx.io.rmii_txv
  io.frame_send <> tx.io.frame_send
  io.frame_receive <> tx.io.frame_receive


  io.setName("")

}

class RMII_TX(config:EthernetConfig) extends Component{

  val MinDataLen = 46
  val MaxDataLen = 1500
  assert(config.curDatalen<=MaxDataLen && config.curDatalen>=MinDataLen,"Ethernet txDatalen should be in range(46,1500)")

  val io = new Bundle {
    val rmii_tx = out Bits (2 bits)
    val rmii_txv = out Bool()
    val tx_data = slave Stream(Bits(config.inDataWidth bits))
    val tx_flag = in Bool()

    val frame_send = in Bool()
    val frame_receive = in Bool()
  }

  val rmii_tx = Reg(Bits (2 bits)) init(0)
  val rmii_txv = Reg(Bool()) init(false)
  val tx_data_ready = Reg(Bool()) init(false)


  val crc32 = new CRCCombinational(CRCCombinationalConfig(
    crcConfig = CRC32.Standard,
    dataWidth = 8 bits
  ))



  val crc32_valid = Reg(Bool()) init(false)
  val crc32_mode = Reg(CRCCombinationalCmdMode()) init(CRCCombinationalCmdMode.INIT)
  val crc32_data = Reg(Bits(8 bits)) init(0)

  crc32.io.cmd.mode := crc32_mode
  crc32.io.cmd.valid := crc32_valid
  crc32.io.cmd.data := crc32_data


  io.rmii_tx := rmii_tx
  io.rmii_txv := rmii_txv

  tx_data_ready := False
  io.tx_data.ready := tx_data_ready


  val fsm = new StateMachine {
    val IDLE = new State with EntryPoint
    val PREAMBLE_AND_FRAMRESTART = new State
    val DESTMAC = new State
    val SOURCEMAC = new State
    val TYPE = new State
    val SENDTIME = new State
    val RECEIVETIME = new State
    val DATA = new State
    val CRC = new State

    val counter = Reg(UInt(16 bits)) init (0)
    val preamble = Reg(Bits(64 bits)).init(Ethernet.parsePreamble(config.preambleData)).allowUnsetRegToAvoidLatch
    val destmac = Reg(Bits(48 bits)).init(Ethernet.parseMacAddress(config.sender)).allowUnsetRegToAvoidLatch
    val sourcemac = Reg(Bits(48 bits)).init(Ethernet.parseMacAddress(config.receiver)).allowUnsetRegToAvoidLatch
    val ethtype = Reg(Bits(16 bits)).init(config.txType).allowUnsetRegToAvoidLatch

    val tx_byte_sel = Reg(UInt(log2Up(config.curDatalen+1) bits)) init(0)
    val tx_bit_sel = Reg(UInt(3 bits)) init(0)

    val timer = Reg(UInt(32 bits)) init(0)
    val frame_send_time = Reg(UInt(32 bits)) init(0)
    val frame_receive_time = Reg(UInt(32 bits)) init(0)


    timer := timer + 1

    when(io.frame_send){
      frame_send_time := timer
    }
    when(io.frame_receive){
      frame_receive_time := timer
    }

    crc32_valid := False

    IDLE
      .whenIsActive{
        when(io.tx_flag){
          goto(PREAMBLE_AND_FRAMRESTART)
        }
      }
      .onExit{
        tx_byte_sel := 0
        tx_bit_sel := 0
      }


    PREAMBLE_AND_FRAMRESTART
      .whenIsActive {
        rmii_txv := True
        rmii_tx(0) := preamble(56+(tx_bit_sel|<<1)-(tx_byte_sel|<<3))
        rmii_tx(1) := preamble(56+(tx_bit_sel|<<1)+1-(tx_byte_sel|<<3))
        tx_bit_sel := tx_bit_sel + 1
        crc32_valid := True //for init
        when(tx_bit_sel===U(3)){
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          when(tx_byte_sel===U(7)){
            tx_byte_sel := 0
            goto(DESTMAC)
          }
        }
      }
      .onExit{
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    DESTMAC
      .whenIsActive {
        rmii_tx(0) := destmac(40 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3))
        rmii_tx(1) := destmac(40 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3))
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := destmac(40-tx_byte_sel*8,8 bits)
          when(tx_byte_sel === U(5)) {
            tx_byte_sel := 0
            goto(SOURCEMAC)
          }
        }
      }
      .onExit {
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    SOURCEMAC
      .whenIsActive {
        rmii_tx(0) := sourcemac(40 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3))
        rmii_tx(1) := sourcemac(40 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3))
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := sourcemac(40 - tx_byte_sel * 8, 8 bits)
          when(tx_byte_sel === U(5)) {
            tx_byte_sel := 0
            goto(TYPE)
          }
        }
      }
      .onExit {
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    TYPE
      .whenIsActive {
        rmii_tx(0) := ethtype((8 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3)).resized)
        rmii_tx(1) := ethtype((8 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3)).resized)
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := ethtype(8- tx_byte_sel * 8, 8 bits)
          when(tx_byte_sel === U(1)) {
            tx_byte_sel := 0
            goto(SENDTIME)
          }
        }
      }
      .onExit {
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    SENDTIME
      .whenIsActive {
        rmii_tx(0) := frame_send_time((24 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3)).resized)
        rmii_tx(1) := frame_send_time((24 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3)).resized)
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := frame_send_time(24 - tx_byte_sel * 8, 8 bits).asBits
          when(tx_byte_sel === U(1)) {
            tx_byte_sel := 0
            goto(RECEIVETIME)
          }
        }
      }
      .onExit {
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    RECEIVETIME
      .whenIsActive {
        rmii_tx(0) := frame_receive_time((24 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3)).resized)
        rmii_tx(1) := frame_receive_time((24 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3)).resized)
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := frame_receive_time(24 - tx_byte_sel * 8, 8 bits).asBits
          when(tx_byte_sel === U(1)) {
            tx_byte_sel := 0
            goto(DATA)
          }
        }
      }
      .onExit {
        tx_data_ready := True
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

    DATA
      .whenIsActive {
        rmii_tx(0) := io.tx_data.payload((config.inDataWidth-8 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3)).resized)
        rmii_tx(1) := io.tx_data.payload((config.inDataWidth-8 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3)).resized)
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(2)){
          crc32_valid := True
          crc32_mode := CRCCombinationalCmdMode.UPDATE
          crc32_data := io.tx_data.payload(config.inDataWidth - tx_byte_sel * 8, 8 bits)
        }
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          tx_data_ready := True
          when(tx_byte_sel === U(config.curDatalen-1)) {
            tx_byte_sel := 0
            goto(CRC)
          }
        }
      }
      .onExit {
        tx_data_ready := False
        tx_bit_sel := 0
        tx_byte_sel := 0
      }


    CRC
      .whenIsActive{
        rmii_tx(0) := crc32.io.crc((crc32.io.crc.getWidth - 8 + (tx_bit_sel |<< 1) - (tx_byte_sel |<< 3)).resized)
        rmii_tx(1) := crc32.io.crc((crc32.io.crc.getWidth - 8 + (tx_bit_sel |<< 1) + 1 - (tx_byte_sel |<< 3)).resized)
        tx_bit_sel := tx_bit_sel + 1
        when(tx_bit_sel === U(3)) {
          tx_bit_sel := 0
          tx_byte_sel := tx_byte_sel + 1
          when(tx_byte_sel === U(3)) {
            tx_byte_sel := 0
            goto(IDLE)
          }
        }

      }
      .onExit {
        tx_bit_sel := 0
        tx_byte_sel := 0
      }

  }

  io.setName("")
  crc32.io.setName("")

}
class RMII_RX(config:EthernetConfig = EthernetConfig()) extends Component{
  val io = new Bundle{
    val rmii_rx = in Bits (2 bits)
    val rmii_rxen = in Bool()
    val fe_flag = out Bool()
    val rx_data = master Stream(Bits(config.outDataWidth bits))
  }

  val Byte_sel = Reg(UInt(log2Up(8) bits)) init(0)
  val Byte_Data = Reg(Bits(8 bits)) init (0)
  val Byte_valid = Reg(Bool()) init (false)

  val debug_rx_1 = Byte_Data(U(2),3 bits) simPublic()

  Byte_valid := False
  when(io.rmii_rxen) {
    Byte_Data(Byte_sel|<<1) := io.rmii_rx(0)
    Byte_Data((Byte_sel|<<1)+1) := io.rmii_rx(1)
    Byte_sel := Byte_sel + 1
    when(Byte_sel === U(3)) {
      Byte_sel := 0
      Byte_valid := True
    }
  }

  val Rx_Data = Reg(Bits(config.outDataWidth bits)) init (0)
  val Rx_Data_valid = Reg(Bool()) init (false)
  val Rx_Data_sel = Reg(UInt(log2Up(config.outDataWidth) bits)) init(0)

  io.rx_data.payload := Rx_Data
  io.rx_data.valid := Rx_Data_valid



  val fsm = new StateMachine {
    val PREAMBLE = new State with EntryPoint
    val FRAMRESTART = new State
    val DESTMAC = new State
    val SOURCEMAC = new State
    val TYPE = new State
    val DATALEN = new State
    val DATA = new State
    val CRC = new State

    val counter = Reg(UInt(16 bits)) init (0)
    val mac = Reg(UInt(48 bits)) init (0)
    val ethtype = Reg(UInt(16 bits)) init (0)
    val fe_flag = Reg(Bool()) init(false)
    val Rx_Data_len = Reg(UInt(16 bits)) init(0)

    io.fe_flag := fe_flag

    Rx_Data_valid := False
    when(io.rmii_rxen) {
      Rx_Data_sel := Rx_Data_sel + 1
      Rx_Data(Rx_Data_sel |<< 1) := io.rmii_rx(0)
      Rx_Data((Rx_Data_sel |<< 1) + 1) := io.rmii_rx(1)
      when(Rx_Data_sel === U((config.outDataWidth / 2 - 1).toInt, log2Up(config.outDataWidth) bits) && isActive(DATA)) {
        Rx_Data_sel := 0
        Rx_Data_valid := True
      }
    }

    PREAMBLE
      .whenIsActive {
        when(Byte_valid) {
          counter := (Byte_Data === EthernetProtocol.PREAMBLE) ? (counter + 1) | 0
          when(counter === U(6)) {
            goto(FRAMRESTART)
          }
        }
      }

    FRAMRESTART
      .onEntry(counter := 0)
      .whenIsActive {
        when(Byte_valid && Byte_Data === EthernetProtocol.FRAMESTART) {
          goto(DESTMAC)
        }
      }

    DESTMAC
      .whenIsActive {
        when(Byte_valid) {
          mac := mac(39 downto 0) @@ Byte_Data.asUInt
          counter := counter + 1
        }
        when(counter === 6){
          goto(SOURCEMAC)
          when(mac =/= U(Ethernet.parseMacAddress(config.receiver), 48 bits)) {
            goto(PREAMBLE)
          }
        }
      }
      .onExit(counter := 0)

    SOURCEMAC
      .whenIsActive {
        when(Byte_valid) {
          mac := mac(39 downto 0) @@ Byte_Data.asUInt
          counter := counter + 1
        }
        when(counter === 6) {
          goto(TYPE)
          when(mac =/= U(Ethernet.parseMacAddress(config.sender), 48 bits)) {
            goto(PREAMBLE)
          }
        }
      }
      .onExit(counter := 0)

    TYPE
      .whenIsActive {
        when(Byte_valid) {
          ethtype := ethtype(7 downto 0) @@ Byte_Data.asUInt
          counter := counter + 1
        }
        when(counter === 2 && ethtype === EthernetProtocol.CONFIGSTART) {
          fe_flag := False
          goto(DATALEN)
        }
        when(counter === 2 && ethtype === EthernetProtocol.CONFIGFINISH) {
          fe_flag := True
          goto(PREAMBLE)
        }
        when(counter === 2 && ethtype === EthernetProtocol.USERTYPE) {
          fe_flag := True
          goto(DATALEN)
        }
      }
      .onExit(counter := 0)

    DATALEN
      .whenIsActive{
        when(Byte_valid) {
          Rx_Data_len := Rx_Data_len(7 downto 0) @@ Byte_Data.asUInt
          counter := counter + 1
          when(counter === 1) {
            goto(DATA)
          }
        }
      }
      .onExit(counter := 0)

    DATA
      .whenIsActive{
        when(Byte_valid){
          counter := counter + 1
          when(counter === Rx_Data_len-1 || !io.rmii_rxen) {
            goto(PREAMBLE)
          }
        }
      }
      .onExit(counter := 0)

  }
  io.setName("")

}


object Ethernet{
  /**
   * to use: val sourceMac = Ethernet.parseMacAddress(sender)
   * @param mac
   * @return
   */
  def parseMacAddress(mac:String):Bits = {
    val ret = B(Long.parseLong(mac.replace(":", ""), 16), 48 bits)
    ret
  }

  def parsePreamble(preamble: String): Bits = {
    val ret = B(Long.parseLong(preamble.replace("_", ""), 16), 64 bits)
    ret
  }

  def generate(config:EthernetConfig = EthernetConfig(),interface:String = "RMII"):Component={
    interface match {
      case "RMII" => new RMII_Ethernet(config)
    }
  }

  def main(args: Array[String]): Unit ={
    //SpinalVerilog(Ethernet.generate())
    SpinalConfig(anonymSignalPrefix = "tmp").generateVerilog(Ethernet.generate()).printPruned()
  }
}





