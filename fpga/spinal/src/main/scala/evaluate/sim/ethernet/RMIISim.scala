package evaluate.sim.ethernet

import spinal.core.sim._
import spinal.crypto.checksum.CRCCombinationalCmdMode
import ultrasonic.ethernet.{EthernetConfig, RMII_Ethernet}

import java.util.zip.CRC32
import scala.collection.mutable.{ArrayBuffer, Queue}

/**
 * @author zw-yao
 * @version 1.0
 */
case class RMIISim(config: EthernetConfig = EthernetConfig()) extends RMII_Ethernet(config) {

  val dataRxFeedQueue = Queue[Int]()
  val dataRxResultQueue = Queue[Int]()
  val dataRxRefQueue = Queue[Int]()

  val dataTxFeedQueue = Queue[Int]()
  val dataTxResultQueue = Queue[Long]()
  val dataTxRefQueue = Queue[Long]()

  val crc = new CRC32()

  var idx = 0


  def init() = {
    clockDomain.forkStimulus(10)
    io.rmii_rx #= 0
    io.rmii_rxen #= false
    io.tx_flag #= false
    io.pulse_send #= false
    crcInit()
    clockDomain.waitSampling(10)
  }

  def referenceModel(dataFeed: Int): Unit = {
    idx = idx + (config.inDataWidth / 8).toInt
    (0 to config.inDataWidth / 8 - 1).foreach(j => {
      val tmp = ((dataFeed >>> 8 * (config.inDataWidth / 8 - j - 1)) & (0xff))
      crc.update(tmp)
      dataTxRefQueue.enqueue(crc.getValue())
    })
    if (idx % config.curDatalen == 0 && idx < (config.curDatalen * (config.inDataWidth / 8))) {
      crcInit()
    }
  }

  def crcInit() = {
    crc.reset()
    (0 to 5).foreach(i => {
      crc.update(Integer.parseInt(config.sender.split(":")(i), 16))
      dataTxRefQueue.enqueue(crc.getValue())
    })
    (0 to 5).foreach(i => {
      crc.update(Integer.parseInt(config.receiver.split(":")(i), 16))
      dataTxRefQueue.enqueue(crc.getValue())
    })
    (0 to 1).foreach(i => {
      crc.update(((config.ethType >> 8 * (1 - i)) & 0xff))
      dataTxRefQueue.enqueue(crc.getValue())
    })
    (0 to 1).foreach(i => {
      crc.update((((idx / config.curDatalen + 1) >> 8 * (1 - i)) & 0xff))
      dataTxRefQueue.enqueue(crc.getValue())
    })
  }

  def rxDriver(): Unit = {
    val drv = fork {
      while (true) {
        if (dataRxFeedQueue.nonEmpty) {
          val dataFeed = dataRxFeedQueue.dequeue()
          io.rmii_rx #= dataFeed
          io.rmii_rxen #= true
        }
        clockDomain.waitRisingEdge()
        if (dataRxFeedQueue.isEmpty) {
          io.rmii_rx #= 0
          io.rmii_rxen #= false
        }
      }
    }
  }

  def txDriver(): Unit = {
    val drv = fork {
      while (dataTxFeedQueue.isEmpty) {}
      io.tx_flag #= true
      val dataFeed = dataTxFeedQueue.dequeue()
      referenceModel(dataFeed)
      io.tx_data.payload #= dataFeed
      while (true) {
        if (dataTxFeedQueue.nonEmpty) {
          io.tx_flag #= true
          if (io.tx_data.ready.toBoolean) {
            val dataFeed = dataTxFeedQueue.dequeue()
            referenceModel(dataFeed)
            io.tx_data.payload #= dataFeed
          }
        }
        if (dataTxFeedQueue.isEmpty) {
          io.tx_flag #= false
        }
        clockDomain.waitRisingEdge()
      }
    }
  }

  def simStart() = {
    init()
    rxDriver()
    txDriver()
    Monitor()
    scoreBoard()
  }


  def Monitor(): Unit = {
    val monitor = fork {
      clockDomain.waitRisingEdge()
      while (true) {
        if (tx.rmii_txv.toBoolean && tx.crc32_valid.toBoolean && (tx.crc32_mode.toEnum == CRCCombinationalCmdMode.UPDATE)) {
          clockDomain.waitRisingEdge()
          dataTxResultQueue.enqueue(tx.crc32_output.toLong)
        } else {
          clockDomain.waitRisingEdge()
        }
      }
    }
  }

  def scoreBoard(): Unit = {
    val score = fork {
      while (true) {
        if (dataTxResultQueue.nonEmpty && dataTxRefQueue.nonEmpty) {
          val ref = dataTxRefQueue.dequeue()
          val result = dataTxResultQueue.dequeue()
          assert(ref == result, s"crc ref: ${ref}, crc result: ${result}")
        }
        clockDomain.waitSampling()
      }
    }
  }

  def waitSimDone(): Unit = {
    clockDomain.waitSampling(10)
    while (dataTxResultQueue.nonEmpty || dataTxRefQueue.nonEmpty) {
      clockDomain.waitSampling(10)
    }
    clockDomain.waitSampling(100)
    simSuccess()
  }

  def insertRxData(data: ArrayBuffer[Int]) = {
    dataRxFeedQueue ++= data
  }

  def insertTxData(data: ArrayBuffer[Int]) = {
    dataTxFeedQueue ++= data
  }


}
