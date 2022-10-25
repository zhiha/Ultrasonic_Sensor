package ultrasonic

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._

import java.lang._

/**
 *
 * @param sender
 * @param receiver
 * @param inDataWidth
 * @param outDataWidth
 *
 * rmii_rx0-->|-------------|<---Tx_DATA[inDataWidth]
 * rmii_rx1-->|             |--------------
 * rmii_rxen->|  ethernet   |--------------
 * rmii_tx0<--|   Module    |--------------
 * rmii_tx1<--|             |--------------
 * rmii_txv<--|-------------|--->Rx_DATA[outDataWidth]
 */

case class EthernetConfig( val sender:String = "11:22:33:44:55:66",
                           val receiver:String = "fa:23:aa:60:10:6f",
                           val inDataWidth:Int = 8,
                           val outDataWidth:Int = 8,
                         )

object EthernetProtocol {
  val PREAMBLE = 0x55
  val FRAMESTART = 0xd5
}



class RMII_Ethernet(config:EthernetConfig) extends Component {
  val io = new Bundle {
    val rmii_rx = in Bits(2 bits)
    val rmii_rxen = in Bool()
    val rmii_tx = out Bits(2 bits)
    val rmii_txv = out Bool()

    val rx_data_payload = out Bits(config.outDataWidth bits)
    val rx_data_valid = out Bool()
    val tx_data_payload = in Bits(config.inDataWidth bits)
    val tx_data_valid = in Bool()
  }

  val rx = new Area {
    val sel = Reg(UInt(log2Up(8) bits))

    val Byte_Data = Reg(Bits(8 bits)) init (0)
    val Byte_valid = Reg(Bool()) init (false)
    val Rx_Data = Reg(Bits(config.outDataWidth bits)) init (0)
    val Rx_valid = Reg(Bool()) init (false)

    when(io.rmii_rxen){
      sel := sel + 1
      Byte_Data(2*sel) := io.rmii_rx(0)
      Byte_Data(2*sel+1) := io.rmii_rx(1)
    }

    Byte_valid := 0
    when(sel === U(3)){
      sel := 0
      Byte_valid := 1
    }

    val fsm = new StateMachine {
      val PREAMBLE = new State with EntryPoint
      val FRAMRESTART = new State
      val DESTMAC = new State
      val SOURCEMAC = new State
      val TYPE = new State
      val DATA = new State
      val CRC = new State

      val counter = Reg(UInt(8 bits)) init (0)
      val mac = Reg(UInt(48 bits)) init(0)

      PREAMBLE
        .whenIsActive {
          when(Byte_valid) {
            counter := (Byte_Data === EthernetProtocol.PREAMBLE) ? (counter+1) | 0
            when(counter === U(6)){
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
          when(Byte_valid){
            mac := mac(39 downto 0) ## Byte_Data
            counter := counter + 1
            when(counter===5){
              goto(SOURCEMAC)
              when(mac=/=Ethernet.parseMacAddress(config.receiver)){
                goto(PREAMBLE)
              }
            }
          }

        }

      SOURCEMAC




    }







  }

  io.rmii_tx := True ## True
  io.rmii_txv := True
  io.rx_data_valid := False
  io.rx_data_payload := 0

  io.setName("")
  rx.setName("")
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
    SpinalVerilog(Ethernet.generate())
  }
}





