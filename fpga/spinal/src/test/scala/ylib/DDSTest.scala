package ylib

import spinal.core._
import spinal.core.sim._
import spinal.sim._
import evaluate.sim.dsp.DDSSim

/**
 * @author zw-yao
 * @version 1.0
 */
object DDSTest {
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.compile(new DDSSim()).doSim{dut =>
      dut.init()
      dut.simStart()
      dut.waitSimDone()
    }
  }

}
