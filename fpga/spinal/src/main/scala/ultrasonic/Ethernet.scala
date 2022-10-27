package ultrasonic

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._

import java.lang._
import mylib._
import spinal.core.Component.push

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

case class EthernetConfig( val sender:String = "fa:23:aa:60:10:6f",
                           val receiver:String = "11:22:33:44:55:66",
                           val inDataWidth:Int = 16,
                           val outDataWidth:Int = 16,
                           val curDatalen:Int = 46,
                         )

object EthernetProtocol {
  val PREAMBLE = 0x55
  val FRAMESTART = 0xd5
  val USERTYPE = 0x0900
  val CONFIGSTART = 0x0A00
  val CONFIGFINISH = 0x0B00
}

class RMII_Ethernet(config:EthernetConfig) extends Component {
  assert(config.outDataWidth%2==0 && config.inDataWidth%2==0,"Ethernet in/out Width should be the pow of 2!")

  val io = new Bundle {
    val rmii_rx = in Bits(2 bits)
    val rmii_rxen = in Bool()
    val rmii_tx = out Bits(2 bits)
    val rmii_txv = out Bool()

    val rx_data = master Stream(Bits(config.outDataWidth bits))
    val fe_flag = out Bool()

    val tx_data = slave Stream(Bits(config.inDataWidth bits))
    val tx_flag = in Bool()


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
  }

  val rmii_tx = Reg(Bits (2 bits)) init(0)
  val rmii_txv = Reg(Bool()) init(false)
  val tx_data_ready = Reg(Bool()) init(false)

//  print(s"fifo depth: ${Math.pow(2,log2Up(config.curDatalen)).toInt}")
//  val fifo = new AsyncFifo(depth = Math.pow(2,log2Up(config.curDatalen)).toInt, width = config.inDataWidth)

  io.rmii_tx := rmii_tx
  io.rmii_txv := rmii_txv

  io.tx_data.ready := tx_data_ready
//  fifo.io.push << io.tx_data


  val fsm = new StateMachine {
    val IDLE = new State with EntryPoint
    val PREAMBLE = new State
    val FRAMRESTART = new State
    val DESTMAC = new State
    val SOURCEMAC = new State
    val TYPE = new State
    val TIME = new State
    val DATA = new State
    val CRC = new State

    val counter = Reg(UInt(16 bits)) init (0)
    val mac = Reg(UInt(48 bits)) init (0)
    val ethtype = Reg(UInt(16 bits)) init (0)

    IDLE
      .whenIsActive{
        tx_data_ready := False
        when(io.tx_flag){
          goto(PREAMBLE)
        }
//        when(fifo.fifo.io.pushOccupancy === U(2)){
//
//        }
      }


    PREAMBLE
      .whenIsActive {
        rmii_txv := True

      }

    FRAMRESTART
      .onEntry(counter := 0)
      .whenIsActive {


      }

    DESTMAC
      .whenIsActive {

      }
      .onExit(counter := 0)

    SOURCEMAC
      .whenIsActive {


      }
      .onExit(counter := 0)

    TYPE
      .whenIsActive {


      }
      .onExit(counter := 0)

    TIME
      .whenIsActive {

      }
      .onExit(counter := 0)

    DATA
      .whenIsActive {

      }
      .onExit(counter := 0)

    CRC
      .whenIsActive{

      }
      .onExit(counter := 0)


  }

  io.setName("")

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





