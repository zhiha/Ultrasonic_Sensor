package mylib

import spinal.core._
import spinal.lib._

class AsyncFifo(val depth:Int = 4,val width:Int=8,val pushCd:ClockDomain,val popCd:ClockDomain) extends Component {
  val io = new Bundle{
    val push = slave(Stream(Bits(width bit)))
    val pop = master(Stream(Bits(width bit)))
  }

//  val pushCd = ClockDomain.external(name="push")
//  val popCd = ClockDomain.external(name="pop",withReset = false)

//  val pop_reset = popCd.readResetWire

  val fifo = StreamFifoCC(Bits(width bit),
    depth = depth,
    pushClock = pushCd,
    popClock = popCd
  )

  fifo.io.push << io.push
  io.pop << fifo.io.pop

}
