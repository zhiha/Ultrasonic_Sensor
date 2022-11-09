package ylib

import breeze.numerics.{atan, pow, cos}
import spinal.core._


/**
 * @author zw-yao
 * @version 1.0
 */

case class CordicConfig(
                       val tableDepth: Int = 20,
                       val width: Int = 32,
                       val peekWidth: Int = 6,
                       val resolution: Int = 26  // width - peekwidth
                       )

case class CordicData(val c:CordicConfig) extends Bundle{
  val x: SInt = SInt(c.width bits) // 1QN
  val y: SInt = SInt(c.width bits) // 1QN
  val z: SInt = SInt(c.width bits) // 2QN
}

class Circular(c:CordicConfig = CordicConfig()) extends Component{
  val io = new Bundle{
    val input = in(CordicData(c))
    val output = out(CordicData(c))
  }

  val tableDepth = c.tableDepth
  val width = c.width
  val peekWidth = c.peekWidth
  val resolution = c.width - c.peekWidth

  val phase = (0 until c.tableDepth).map(i => S((atan(pow(2.0,-i))*(1<<(resolution))).toInt, c.width bits))
  val k = S(((0 until c.tableDepth).map(i => cos(atan(pow(2.0,-i)))).reduce(_*_)*(1<<(resolution))).toInt,c.width bits)

  val x = Vec(Reg(SInt(width bits)) init(0),tableDepth)
  val y = Vec(Reg(SInt(width bits)) init(0),tableDepth)
  val z = Vec(Reg(SInt(width bits)) init(0),tableDepth)


}

case class CircularRotate(c:CordicConfig = CordicConfig()) extends Circular(c){

  val halfpi = S((math.Pi/2*(1<<(c.resolution))).toInt,c.width bits)
  val pi = S((math.Pi*(1<<(c.resolution))).toInt,c.width bits)
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

  val z2pi = (io.input.z % (pi<<1).resize(c.width)) - pi
  var zpi = z2pi

  when(((z2pi<=halfpi) && (z2pi>=0)) || ((z2pi>=(-halfpi)) && (z2pi <=0))){
    flag(0) := False
  }otherwise {
    when(z2pi>0){
      zpi \= pi - z2pi
    }otherwise{
      zpi \= z2pi + pi
    }
    flag(0) := True
  }

  x(0) := io.input.x
  y(0) := io.input.y
  z(0) := zpi
  io.output.x := Mux(flag(tableDepth-1),(x(tableDepth-1)*k).fixTo((2*width-peekWidth-1) downto (resolution)),-(x(tableDepth-1)*k).fixTo((2*width-peekWidth-1) downto (resolution)))
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
  io.output.x := (x(tableDepth-1)*k).fixTo((2*width-peekWidth-1) downto (resolution))
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
