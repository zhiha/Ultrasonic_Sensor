package evaluate.sim.dsp


import scala.collection.mutable._
import spinal.core.sim._
import ylib.{CircularRotate, CircularVector, CordicConfig}
import scala.util.Random


case class CordicSimData(x:Int,y:Int,z:Int)


/**
 * @author zw-yao
 * @version 1.0
 */


class CircularRotateSim(c:CordicConfig=CordicConfig()) extends CircularRotate(c){
  val FeedQueue = Queue[Int]()
  val ResultQueue = Queue[Int]()
  val RefQueue = Queue[Int]()

  def init() = {
    clockDomain.forkStimulus(10)
    io.input.x #= 1<<(c.resolution)
    io.input.y #= 0
  }

  def referenceModel(d:Double): Unit = {
    RefQueue.enqueue((math.cos(d)*(1<<(c.resolution))).toInt)
  }

  def Driver()={
    val drv = fork{
      var idx = 0
      while (idx<2000){
        val d = (Random.nextInt(360))*math.Pi/180
        insertData(d)
        referenceModel(d)
        io.input.z #= FeedQueue.dequeue()
        idx = idx + 1
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
      clockDomain.waitSampling(delay)
      while (true) {
        clockDomain.waitRisingEdge()
        ResultQueue.enqueue(io.output.x.toInt)
      }
    }
  }

  def scoreBoard(): Unit = {
    val score = fork {
      var idx = 0
      while (true) {
        clockDomain.waitSampling()
        if(RefQueue.nonEmpty && ResultQueue.nonEmpty){
          idx = idx + 1
          val ref = RefQueue.dequeue()
          val result = ResultQueue.dequeue()
          print(s"cnt: ${idx} ,ref: ${ref}, result: ${result} \n")
          assert((math.abs(ref-result).toDouble/(1<<(c.resolution)))<1e-3,s"ref (${ref.toDouble/(1<<(c.resolution))}) != result (${result.toDouble/(1<<(c.resolution))}) at cnt ${idx}")
        }
      }
    }
  }

  def waitSimDone(): Unit = {
    clockDomain.waitSampling()
    while (RefQueue.nonEmpty || ResultQueue.nonEmpty) {
      clockDomain.waitRisingEdge()
    }
    simSuccess()
  }

  def insertData(d:Double):Unit={
    FeedQueue.enqueue((d*(1<<(c.resolution))).toInt)
  }

}

class CircularVectorSim(c:CordicConfig=CordicConfig()) extends CircularVector(){
  val FeedQueue = Queue[CordicSimData]()
  val ResultQueue = Queue[CordicSimData]()
  val RefQueue = Queue[CordicSimData]()

  def init() = {
    clockDomain.forkStimulus(10)
    io.input.x #= 0
    io.input.y #= 0
    io.input.z #= 0
  }

  def referenceModel(d:CordicSimData): Unit = {
    val x = math.sqrt(d.x*d.x+d.y*d.y).toInt
    val y = 0
    val z = (math.atan(d.y.toDouble/d.x)*(1<<(c.resolution))).toInt
    RefQueue.enqueue(CordicSimData(x,y,z))
  }

  def Driver()={
    val drv = fork{
      var idx = 0
      while (idx<200){
        val x = (Random.nextDouble()*(1<<(c.resolution-1))).toInt
        val y = (Random.nextDouble()*(1<<(c.resolution-1))).toInt
        insertData(CordicSimData(x,y,0))
        referenceModel(CordicSimData(x,y,0))
        val d = FeedQueue.dequeue()
        io.input.x #= d.x
        io.input.y #= d.y
        idx = idx + 1
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
      clockDomain.waitSampling(delay)
      while (true) {
        clockDomain.waitRisingEdge()
        val x = io.output.x.toInt
        val z = io.output.z.toInt
        ResultQueue.enqueue(CordicSimData(x,0,z))
      }
    }
  }

  def scoreBoard(): Unit = {
    val score = fork {
      var idx = 0
      while (true) {
        clockDomain.waitSampling()
        if(RefQueue.nonEmpty && ResultQueue.nonEmpty){
          idx = idx + 1
          val ref = RefQueue.dequeue()
          val result = ResultQueue.dequeue()
//          print(s"cnt: ${idx} ,ref.x: ${ref.x}, result.x: ${result.x} \n")
          assert((math.abs(ref.x-result.x).toDouble/(1<<(c.width-2)))<1e-3,s"ref (${ref.x.toDouble/(1<<(c.width-2))}) != result (${result.x.toDouble/(1<<(c.width-2))}) at cnt ${idx}")
          assert((math.abs(ref.z-result.z).toDouble/(1<<(c.width-2)))<1e-3,s"ref (${ref.z.toDouble/(1<<(c.width-2))}) != result (${result.z.toDouble/(1<<(c.width-2))}) at cnt ${idx}")
        }
      }
    }
  }

  def waitSimDone(): Unit = {
    clockDomain.waitSampling()
    while (RefQueue.nonEmpty || ResultQueue.nonEmpty) {
      clockDomain.waitRisingEdge()
    }
    simSuccess()
  }

  def insertData(d: CordicSimData):Unit={
    FeedQueue.enqueue(d)
  }

}