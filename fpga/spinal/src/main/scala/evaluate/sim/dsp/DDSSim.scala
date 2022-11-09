package evaluate.sim.dsp

import ylib.DDSRom
import scala.collection.mutable._
import spinal.core.sim._
import ylib.FmcwDdsRomConfig
import evaluate.native.NativeDDS

/**
 * @author zw-yao
 * @version 1.0
 */
class DDSRomSim(val config:FmcwDdsRomConfig=FmcwDdsRomConfig()) extends DDSRom(config){
  val dataResultQueue = Queue[Int]()
  val dataRefQueue = Queue[Int]()

  def init() = {
    clockDomain.forkStimulus(10)
  }

  def referenceModel(): Unit = {
    dataRefQueue ++= NativeDDS.refData(config)
  }

  def Driver()={
    val drv = fork{
      while (true){
        clockDomain.waitRisingEdge()
      }
    }
  }

  def simStart() = {
    init()
    Driver()
    Monitor()
    scoreBoard()
  }

  def Monitor(): Unit = {
    val monitor = fork {
      referenceModel()
      clockDomain.waitSampling(delay)
      while (true) {
        clockDomain.waitRisingEdge()
        dataResultQueue.enqueue(io.dataOut.toInt)
      }
    }
  }

  def scoreBoard(): Unit = {
    val score = fork {
      var idx = 0
      while (true) {
        clockDomain.waitSampling()
        if(dataRefQueue.nonEmpty && dataResultQueue.nonEmpty){
          idx = idx + 1
          val ref = dataRefQueue.dequeue()
          val result = dataResultQueue.dequeue()
//          print(s"cnt: ${idx} ,ref: ${ref}, result: ${result} \n")
          assert((math.abs(ref-result).toDouble/(1<<(config.signalResolution-2)))<5e-3,s"ref (${ref.toDouble/(1<<(config.signalResolution-2))}) != result (${result.toDouble/(1<<(config.signalResolution-2))}) at cnt ${idx}")
        }
      }
    }
  }

  def waitSimDone(): Unit = {
    clockDomain.waitSampling(10)
    while (dataRefQueue.nonEmpty) {
      clockDomain.waitRisingEdge()
    }
    simSuccess()
  }

}
