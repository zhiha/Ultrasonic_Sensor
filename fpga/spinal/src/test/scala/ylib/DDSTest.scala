package ylib

import spinal.core.sim._
import evaluate.sim.dsp.{DDSCordicSim, DDSRomSim}
import org.scalatest.funsuite.AnyFunSuite

/**
 * @author zw-yao
 * @version 1.0
 */
object DDSTest {
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.compile(new DDSRomSim()).doSim{dut =>
      dut.init()
      dut.simStart()
      dut.waitSimDone()
    }
  }
}

class DDSTest extends AnyFunSuite{
  test("DDSCordic Test"){
    SimConfig.withWave.compile(new DDSCordicSim(DdsCordicConfig(cordic = CordicConfig(phaseWidth = 64,phaseResolutionWidth = 60)))).doSim{dut =>
      dut.init()
      dut.simStart()
      dut.waitSimDone()
    }
  }
}