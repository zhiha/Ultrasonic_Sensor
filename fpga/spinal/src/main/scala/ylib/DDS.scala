package ylib

import spinal.core._
import spinal.core.sim._


case class FmcwDdsConfig(
                          val phaseResolution: Int = 12,
                          val signalResolution: Int = 16,
                          val coefResolution:Int = 32,
                          val resourceWidth:Int = 64,
                          val chirpTime: Double = 1e-2,
                          val bandwidth: Double = 1e3,
                          val fclk: Double = 4e6,
                          val fc: Double = 40e3
                        )

/**
 * @author zw-yao
 * @version 1.0
 */

class DDS(config:FmcwDdsConfig=FmcwDdsConfig()) extends Component {
  val io = new Bundle{
    val configFlag = in Bool()
    val dataOut = out SInt(config.signalResolution bits)
  }

  //Default Parameter
  val fclk = config.fclk
  val fc = config.fc
  val chirpTime = config.chirpTime
  val bandwidth = config.bandwidth
  val slope = bandwidth / chirpTime
  val sampleCount = math.pow(2,config.phaseResolution).toInt
  val signalCount = (chirpTime*fclk).toInt
  val coefFactor = BigDecimal(math.pow(2,config.coefResolution))

  val coe_1 = Reg(UInt(config.resourceWidth bits)).allowUnsetRegToAvoidLatch init(((fc*sampleCount/fclk)*coefFactor+(slope*sampleCount/fclk/fclk/2)*coefFactor).toBigInt())
  val coe_2 = Reg(UInt(config.resourceWidth bits)).allowUnsetRegToAvoidLatch init(((slope*sampleCount/fclk/fclk)*coefFactor).toBigInt()) simPublic()

  val cnt = Reg(UInt(32 bits)) init(0) simPublic()
  val step_cur = Reg(UInt(config.resourceWidth bits)) init(0)
  val step_acc = Reg(UInt(config.resourceWidth bits)) init(0)
  val step = Reg(UInt(config.phaseResolution bits)) init(0)
  val rom =  Mem(SInt(config.signalResolution bits),initialContent = sinTable)
  val flag = Reg(Bool()) init(false)

  cnt := cnt + 1
  step_cur := step_cur + coe_2
  step_acc := step_acc + step_cur

  when(cnt===0){
    step_cur := 0
  }

  when(cnt===1){
    step_cur := coe_1
  }

  step := step_acc.fixTo(config.resourceWidth downto (config.coefResolution)).resized

  when(cnt===U(signalCount) && ~flag){
    cnt := 0
    flag := True
  }

  when(flag){
    step_acc := 0
    flag := False
  }

  io.dataOut := rom.readSync(step)


  def sinTable = for(sampleIndex <- 0 until sampleCount) yield {
    val sinValue = Math.sin(2 * Math.PI * sampleIndex / sampleCount)
    S((sinValue * (1<<(config.signalResolution-2))).toShort,config.signalResolution bits)
  }

  def delay = 4


}

class PhaseAccumulator(val phaseResolution:Int = 12) extends Component{
  val io = new Bundle{
    val addr = out UInt(phaseResolution bits)
  }



}
