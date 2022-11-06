package evaluate.cases.ethernet

import ultrasonic.ethernet.EthernetConfig
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

/**
 * @author zw-yao
 * @version 1.0
 */
object RMIICase {


  def testRxCase(config: EthernetConfig, seed: Int = 0) = {
    rawSampleRxToBit(rawSampleRxData(config, seed))
  }

  def testTxCase(config: EthernetConfig, seed: Int = 0) = {
    rawSampleTxData(config, seed)
  }


  def rawSampleRxData(config: EthernetConfig, seed: Int = 0): ArrayBuffer[Int] = {
    val ret = ArrayBuffer[Int]()
    //Preamble
    (0 to 6).foreach(_ => ret.append(0x55))
    //FrameStart
    ret.append(0xd5)
    //receiver
    (0 to 5).foreach(i => {
      ret.append(Integer.parseInt(config.receiver.split(":")(i), 16))
    })
    //sender
    (0 to 5).foreach(i => {
      ret.append(Integer.parseInt(config.sender.split(":")(i), 16))
    })
    //ethtype
    (0 to 1).foreach(i => {
      ret.append(((config.ethType >> 8 * (1 - i)) & 0xff))
    })
    //len
    (0 to 1).foreach(i => {
      ret.append(((config.curDatalen >> 8 * (1 - i)) & 0xff))
    })
    //data
    Random.setSeed(seed)
    (0 to config.curDatalen - 1).foreach(i => {
      ret.append((Random.nextInt(256)))
    })
    ret
  }

  def rawSampleRxToBit(raw: ArrayBuffer[Int], width: Int = 2): ArrayBuffer[Int] = {
    val ret = ArrayBuffer[Int]()
    raw.foreach(i => {
      (0 to 8 / width - 1).foreach(j => {
        val tmp = ((i >>> width * j) & (0xff >>> (8 - width)))
        ret.append(tmp)
      })
    })
    ret
  }

  def rawSampleTxData(config: EthernetConfig, seed: Int = 0) = {
    val ret = ArrayBuffer[Int]()
    Random.setSeed(seed)
    for (_ <- (0 to config.curDatalen - 1)) {
      val value = Random.nextInt(math.pow(2, config.inDataWidth).toInt)
      ret.append(value)
    }
    ret
  }
}
