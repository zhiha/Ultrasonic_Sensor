package mylib

import spinal.core.sim._
import spinal.core._

import scala.util.Random



object TestAsyncFifo {
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.compile(new AsyncFifo()).doSim {
      dut =>
        dut.pushCd.forkStimulus(10)
        dut.popCd.forkStimulus(20)
        dut.io.push.payload #= 0
        dut.io.push.valid #= false
        dut.io.pop.ready #= false
        dut.pushCd.waitRisingEdge()
        val len = 20
        for (elem <- (0 to len - 1)) {
          dut.io.push.valid #= true
          dut.io.push.payload #= Random.nextInt(256)
          dut.pushCd.waitRisingEdge()
        }
        for (elem <- (0 to len - 1)) {
          dut.io.pop.ready #= true
          dut.pushCd.waitRisingEdge()
        }


    }
  }

}
