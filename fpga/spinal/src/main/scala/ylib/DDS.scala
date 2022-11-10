package ylib

import spinal.core._
import spinal.core.sim._

case class FmcwConfig(
                       val chirpTime: Double = 5e-2,
                       val bandwidth: Double = 4e3,
                       val fclk: Double = 4e6,
                       val fc: Double = 40e3
                     )

case class DdsRomConfig(
                         val dataWidth: Int = 16,  // == romSignalWidth
                         val dataAmpWidth:Int = 14, // == romSignalAmpWidth
                         val romSignalWidth: Int = 16,
                         val romSignalAmpWidth: Int = 14,
                         val romDepthWidth: Int = 12,
                         val coefWidth: Int = 64,
                         val coefResolutionWidth: Int = 32,
                         val fmcw:FmcwConfig = FmcwConfig(),
                        )

/**
 * @author zw-yao
 * @version 1.0
 */

class DDSRom(config:DdsRomConfig=DdsRomConfig()) extends Component {
  val io = new Bundle{
    val configFlag = in Bool()
    val dataOut = out SInt(config.dataWidth bits)
  }

  //Default Parameter
  val fclk = config.fmcw.fclk
  val fc = config.fmcw.fc
  val chirpTime = config.fmcw.chirpTime
  val bandwidth = config.fmcw.bandwidth
  val slope = bandwidth / chirpTime
  val sampleCount = math.pow(2,config.romDepthWidth).toInt
  val signalCount = (chirpTime*fclk).toInt
  val coefFactor = BigDecimal(math.pow(2,config.coefResolutionWidth))

  val coe_1 = Reg(UInt(config.coefWidth bits)).allowUnsetRegToAvoidLatch init(((fc*sampleCount/fclk)*coefFactor+(slope*sampleCount/fclk/fclk/2)*coefFactor).toBigInt())
  val coe_2 = Reg(UInt(config.coefWidth bits)).allowUnsetRegToAvoidLatch init(((slope*sampleCount/fclk/fclk)*coefFactor).toBigInt()) simPublic()

  val cnt = Reg(UInt(32 bits)) init(0) simPublic()
  val step_cur = Reg(UInt(config.coefWidth bits)) init(0)
  val step_acc = Reg(UInt(config.coefWidth bits)) init(0)
  val step = Reg(UInt(config.romDepthWidth bits)) init(0)
  val rom =  Mem(SInt(config.romSignalWidth bits),initialContent = sinTable)
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

  step := step_acc.fixTo(config.coefWidth downto (config.coefResolutionWidth)).resized

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
    S((sinValue * (1<<(config.romSignalWidth-2))).toShort,config.romSignalWidth bits)
  }

  def delay = 4

}

case class DdsCordicConfig(
                            val fmcw:FmcwConfig = FmcwConfig(),
                            val cordic:CordicConfig = CordicConfig()
                          )

class DDSCordic(config:DdsCordicConfig=DdsCordicConfig()) extends Component {
  val io = new Bundle{
    val dataOut = out SInt(config.cordic.dataWidth bits)
  }


  //Default Parameter
  val fclk = config.fmcw.fclk
  val fc = config.fmcw.fc
  val chirpTime = config.fmcw.chirpTime
  val bandwidth = config.fmcw.bandwidth
  val slope = bandwidth / chirpTime
  val signalCount = (chirpTime*fclk).toLong
  val c = config.cordic

  val cordic = CircularRotate(c)
  val phi = U(BigDecimal((2*math.Pi*fc/fclk+math.Pi*slope/fclk/fclk)*(math.pow(2,c.phaseResolutionWidth))).toBigInt(),c.phaseWidth bits)
  val deltaphi = U(BigDecimal((2*math.Pi*slope/fclk/fclk)*(math.pow(2,c.phaseResolutionWidth))).toBigInt(),c.phaseWidth bits)
  val pi2 = U(BigDecimal(2*math.Pi*(math.pow(2,c.phaseResolutionWidth))).toBigInt(),c.phaseWidth bits)

  val cnt = Reg(UInt(32 bits)) init(0) simPublic()
  val step_cur = Reg(UInt(c.phaseWidth bits)) init(0)
  val step_acc = Reg(UInt(c.phaseWidth bits)) init(0)
  val step = Reg(UInt(c.phaseWidth bits)) init(0)

  val flag = Reg(Bool()) init(false)

  cnt := cnt + 1
  step_cur := step_cur + deltaphi
  step_acc := (step_acc + step_cur) % pi2

  when(cnt===0){
    step_cur := 0
  }

  when(cnt===1){
    step_cur := phi
  }

  when(cnt===U(signalCount) && ~flag){
    cnt := 0
    flag := True
  }

  when(flag){
    step_acc := 0
    flag := False
  }

  cordic.io.input.x := (math.pow(2,c.dataAmpWidth)).toInt
  cordic.io.input.y := 0
  cordic.io.input.z := step_acc.asSInt

  io.dataOut := cordic.io.output.x


  def delay = 1 + cordic.delay + 1

}


