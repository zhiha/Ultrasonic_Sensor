package ylib

import breeze.numerics.{atan, pow, cos}
import spinal.core._


/**
 * @author zw-yao
 * @version 1.0
 */

case class CordicConfig(
                       val tableDepth: Int = 24,
                       val dataWidth: Int = 16,
                       val dataAmpWidth: Int = 13,
                       val phaseWidth: Int = 20,
                       val phasePeekWidth: Int = 4,
                       val phaseResolutionWidth: Int = 16
                       )

case class CordicData(val c:CordicConfig) extends Bundle{
  val x: SInt = SInt(c.dataWidth bits)
  val y: SInt = SInt(c.dataWidth bits)
  val z: SInt = SInt(c.phaseWidth bits)
}

class Circular(c:CordicConfig = CordicConfig()) extends Component{
  val io = new Bundle{
    val input = in(CordicData(c))
    val output = out(CordicData(c))
  }

  val tableDepth = c.tableDepth
  val dataWidth = c.dataWidth
  val dataAmpWidth = c.dataAmpWidth
  val phaseWidth = c.phaseWidth
  val phasePeekWidth = c.phasePeekWidth
  val phaseResolutionWidth = c.phaseResolutionWidth


  val phase = (0 until c.tableDepth).map(i => S(BigDecimal(atan(pow(2.0,-i))*math.pow(2,phaseResolutionWidth)).toBigInt(), phaseWidth bits))
  val k = S((((0 until c.tableDepth).map(i => cos(atan(pow(2.0,-i))))).reduce(_*_)*math.pow(2,dataAmpWidth)).toInt, dataWidth bits)

  val x = Vec(Reg(SInt(dataWidth bits)) init(0),tableDepth)
  val y = Vec(Reg(SInt(dataWidth bits)) init(0),tableDepth)
  val z = Vec(Reg(SInt(phaseWidth bits)) init(0),tableDepth)

  io.setName("")

}

case class CircularRotate(c:CordicConfig = CordicConfig()) extends Circular(c){

  val halfpi = S(BigDecimal(math.Pi/2*math.pow(2,phaseResolutionWidth)).toBigInt(),phaseWidth bits)
  val pi = S(BigDecimal(math.Pi*math.pow(2,phaseResolutionWidth)).toBigInt(),phaseWidth bits)
  val flag = Vec(Reg(Bool()) init(false),tableDepth)

  for (idx <- 0 until (tableDepth-1)){
    when(z(idx)>0){
      x(idx+1) := x(idx) - (y(idx)|>>(idx))
      y(idx+1) := y(idx) + (x(idx)|>>(idx))
      z(idx+1) := z(idx) - phase(idx)
    }.otherwise{
      x(idx+1) := x(idx) + (y(idx)|>>(idx))
      y(idx+1) := y(idx) - (x(idx)|>>(idx))
      z(idx+1) := z(idx) + phase(idx)
    }
    flag(idx+1) := flag(idx)
  }

  val z2pi = io.input.z - pi
  var zpi = z2pi

  when(((z2pi>=0) && (z2pi<=halfpi)) || ((z2pi>=(-halfpi)) && (z2pi <=0))){
    flag(0) := False
  }otherwise {
    zpi \= Mux(z2pi>0,pi - z2pi,z2pi + pi)
    flag(0) := True
  }

  x(0) := io.input.x
  y(0) := io.input.y
  z(0) := zpi
  io.output.x := Mux(flag(tableDepth-1),(x(tableDepth-1)*k).fixTo((dataWidth + dataAmpWidth - 1) downto (dataAmpWidth)),-(x(tableDepth-1)*k).fixTo((dataWidth + dataAmpWidth - 1) downto (dataAmpWidth)))
  io.output.y := 0
  io.output.z := z(tableDepth-1)

  def delay = tableDepth

}

case class CircularVector(c:CordicConfig = CordicConfig()) extends Circular(c){

  for (idx <- 0 until (tableDepth-1)) {
    when(y(idx) > 0) {
      x(idx + 1) := x(idx) + (y(idx) >> (idx))
      y(idx + 1) := y(idx) - (x(idx) >> (idx))
      z(idx + 1) := z(idx) + phase(idx)
    }.otherwise {
      x(idx + 1) := x(idx) - (y(idx) >> (idx))
      y(idx + 1) := y(idx) + (x(idx) >> (idx))
      z(idx + 1) := z(idx) - phase(idx)
    }
  }

  x(0) := io.input.x
  y(0) := io.input.y
  z(0) := io.input.z
  io.output.x := (x(tableDepth-1)*k).fixTo((dataWidth + dataAmpWidth - 1) downto (dataAmpWidth))
  io.output.y := 0
  io.output.z := z(tableDepth-1)

  def delay = tableDepth

}


object Cordic {
  def main(args: Array[String]): Unit = {
    SpinalVerilog(generate(mode = "ROTATE"))
  }

  def generate(mode:String = "ROTATE", sys:String = "CIRCULAR" ,c:CordicConfig = CordicConfig()) = {
    (sys,mode) match {
      case ("CIRCULAR","ROTATE") => CircularRotate(c)
      case ("CIRCULAR","VECTOR") => CircularVector(c)
    }
  }
}
