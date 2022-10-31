package ultrasonic
import spinal.core.sim._
import spinal.core._

import scala.collection.mutable.ArrayBuffer
import java.lang._
import scala.util.Random


object TestEthernet {
  def main(args: Array[String]): Unit = {
    val config = EthernetConfig()
    SimConfig.withWave.compile(new RMII_Ethernet(config)).doSim{
      dut =>
        dut.clockDomain.forkStimulus(10)
        dut.io.rmii_rx #= 0
        dut.io.rmii_rxen #= false
        dut.io.tx_flag #= false
        dut.io.pulse_send #= false
        dut.clockDomain.waitRisingEdge()
        val frameNum = 10
        val slotNum = 100
        for (elem <- (0 to frameNum-1)) {
          val simData = EthernetSampleData.rawSampleToBit(EthernetSampleData.rawSampleData())
          for (elem <- simData) {
            dut.io.rmii_rx #= elem.toInt
            dut.io.rmii_rxen #= true
            dut.clockDomain.waitRisingEdge()
          }
          for (elem <- (0 to slotNum - 1)) {
            dut.io.rmii_rx #= 0
            dut.io.rmii_rxen #= false
            dut.clockDomain.waitRisingEdge()
          }
        }
        dut.clockDomain.waitRisingEdge()
        dut.io.tx_flag #= true
        dut.io.tx_data.valid #= true
        var idx = 0
        var flag = true
        val value = 0
        dut.io.tx_data.payload #= value
        print("value : " + value + "\n")
        while(flag){
          dut.clockDomain.waitRisingEdge()
          if(dut.io.tx_data.ready.toBoolean && dut.io.tx_data.valid.toBoolean){
            val value = 0//Random.nextInt(2500)
            print("value : " + value + "\n")
            dut.io.tx_data.payload #= value
            idx = idx + 1
          }
          if((idx / config.curDatalen) == 5){
            flag = false
          }
        }

    }
  }

}

object EthernetSampleData{
  def rawSampleData(sender:String="fa:23:aa:60:10:6f",receiver:String="11:22:33:44:55:66",ethtype:Int=0x0900,len:Int=0x0002):ArrayBuffer[Byte]={
    val ret = ArrayBuffer[Byte]()
    //Preamble
    (0 to 6).foreach(_ => ret.append(0x55.toByte))
    //FrameStart
    ret.append(0xd5.toByte)
    //receiver
    (0 to 5).foreach(i => {
      ret.append(Integer.parseInt(receiver.split(":")(i),16).toByte)
    })
    //sender
    (0 to 5).foreach(i => {
      ret.append(Integer.parseInt(sender.split(":")(i), 16).toByte)
    })
    //ethtype
    (0 to 1).foreach(i => {ret.append( ((ethtype >> 8*(1-i)) & 0xff).toByte)})
    //len
    (0 to 1).foreach(i => {ret.append( ((len >> 8*(1-i)) & 0xff).toByte)})
    //data
    (0 to len-1).foreach(i => {ret.append((Math.random()*128).toByte)
    })
    ret.foreach(i=>print(Byte.parseByte(i.toString).toHexString + " "))
    print("\n")
    ret
  }

  def rawSampleToBit(raw:ArrayBuffer[Byte],width:Int = 2):ArrayBuffer[Byte] ={
    val ret = ArrayBuffer[Byte]()
    raw.foreach(i => {
      (0 to 8/width-1).foreach(j => {
        val tmp = ((i >>> width*j) & (0xff>>>(8-width))).toByte
        ret.append(tmp)
      })
    })
    ret
  }

  def rawValidData(len: Int = 90): ArrayBuffer[Byte] = {
    val ret = ArrayBuffer[Byte]()
    //data
    (0 to len - 1).foreach(i => {
      ret.append((Math.random() * 128).toByte)
    })
    ret.foreach(i => print(Byte.parseByte(i.toString).toHexString + " "))
    print("\n")
    ret
  }

  def main(args: Array[String]): Unit = {
    val ret = EthernetSampleData.rawSampleData()
    val retbit = rawSampleToBit(ret)
    retbit.foreach(i => if(i==1) print("01 ") else if(i==2) print("10 ") else if(i==3) print("11 ") else if(i==0) print("00 "))
    print("\n")
    ret.foreach(i=>print(Byte.parseByte(i.toString).toHexString + " "))
  }
}
