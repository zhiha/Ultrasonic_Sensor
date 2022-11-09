package ylib

import org.scalatest.funsuite._
import spinal.core.sim._
import evaluate.sim.dsp.{CircularRotateSim, CircularVectorSim}

/**
 * @author zw-yao
 * @version 1.0
 */
class CordicTest extends AnyFunSuite {
  test("test CircularRotate!"){
    SimConfig.withWave.doSim(new CircularRotateSim()){
      dut =>
        dut.init()
        dut.simStart()
        dut.waitSimDone()
    }
  }

  test("test CircularVector!"){
    SimConfig.withWave.doSim(new CircularVectorSim()){
      dut =>
        dut.init()
        dut.simStart()
        dut.waitSimDone()
    }
  }
}
