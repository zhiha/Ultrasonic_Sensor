package ylib

import spinal.core._
import spinal.core.sim._
import zlib.ds._


object SigmaDeltaTest {
  def main(args: Array[String]): Unit = {
    val cfg = SomeDeltaSigma.cases(args(0).toInt)
    SpinalVerilog(cfg.com(16))
//    SimConfig.withWave.compile(new config.com(16))
  }

}
