package ultrasonic

import evaluate.cases.ethernet.RMIICase._
import evaluate.sim.ethernet._
import spinal.core.sim._
import ultrasonic.ethernet.EthernetConfig



object EthernetTest {
  def main(args: Array[String]): Unit = {
    val config = EthernetConfig()
    SimConfig.withWave.compile(RMIISim(config)).doSim{
      dut =>
        val rxData = testRxCase(config)
        val txData = testTxCase(config)
        dut.simStart()
        dut.insertRxData(rxData)
        dut.insertTxData(txData)
        dut.waitSimDone()
    }
  }
}

