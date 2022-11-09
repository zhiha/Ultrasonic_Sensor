package ylib

import spinal.core.sim._
import evaluate.sim.dsp.DDSRomSim

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
