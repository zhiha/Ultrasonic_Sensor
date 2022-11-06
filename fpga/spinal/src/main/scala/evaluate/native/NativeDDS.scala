package evaluate.native

import scala.collection.mutable.ArrayBuffer
import ylib.FmcwDdsConfig


/**
 * @author zw-yao
 * @version 1.0
 */
object NativeDDS {
  def main(args: Array[String]): Unit = {
//    nativeSim()
    fixSim()
  }


  def refData(config: FmcwDdsConfig=FmcwDdsConfig())={
    val signalResolution = config.signalResolution
    val fclk = config.fclk
    val fc = config.fc
    val T = config.chirpTime
    val B = config.bandwidth
    val S = B/T

    val signalFactor = math.pow(2,signalResolution).toInt
    val N_sample = (T*fclk).toInt

    val t = for(idx <- (0 to (N_sample-1))) yield 1/fclk*idx
    val tx_ref = for(ele <- t) yield {(math.sin(2*math.Pi*fc*ele+math.Pi*S*ele*ele)*signalFactor/4).toInt}


    tx_ref
  }

  def fixSim(config:FmcwDdsConfig=FmcwDdsConfig()) = {
    val phaseResolution = config.phaseResolution
    val signalResolution = config.signalResolution
    val coefResolution = config.coefResolution
    val fclk = config.fclk
    val fc = config.fc
    val T = config.chirpTime
    val B = config.bandwidth
    val S = B/T

    val N_rom = math.pow(2,phaseResolution).toInt
    val signalFactor = math.pow(2,signalResolution).toInt
    val romSin = for (idx <- (0 to (N_rom-1))) yield (math.sin(2*math.Pi*idx/N_rom)*signalFactor/4).toInt
    val N_sample = (T*fclk).toInt

    val t = for(idx <- (0 to (N_sample-1))) yield 1/fclk*idx
    val tx_ref = for(ele <- t) yield {(math.sin(2*math.Pi*fc*ele+math.Pi*S*ele*ele)*signalFactor/4).toInt}


    val coefFactor = math.pow(2,coefResolution).toLong
    val c1 = ((fc*N_rom/fclk)*coefFactor).toLong
    val c2 = ((S*N_rom/2/fclk/fclk)*coefFactor).toLong

    var cnt = 0
    var sum = 0
    var step_acc = 0.toLong
    var step = 0


    val tx = new ArrayBuffer[Int]()

    while(cnt<N_sample){
      tx.append(romSin(step))
      cnt = cnt + 1
      sum = (cnt + cnt - 1)
      step_acc = (step_acc + (c1+c2*sum))
      println("step: "+step)
      step = ((step_acc/coefFactor).toInt+1)%N_rom
    }

    val err = (for(idx <- (0 to (N_sample-1))) yield {math.abs(tx_ref(idx)-tx(idx)).toLong}).reduce(_+_)

    tx_ref

  }

  def nativeSim() = {
    val phaseResolution = 12
    val N = math.pow(2,phaseResolution).toInt
    val fClk = 4e6
    val deltaf = fClk / N
    val romSin = for (idx <- (0 to (N-1))) yield math.sin(2*math.Pi*idx/N)
    val fc = 40e3
    val T = 1e-2
    val B = 1e3
    val S = B/T
    val N_sample = (T*fClk).toInt

    val t_ref = for(idx <- (0 to (N_sample-1))) yield 1/fClk*idx
    val tx_ref = for(ele <- t_ref) yield {math.sin(2*math.Pi*fc*ele+math.Pi*S*ele*ele)}

    val c1 = fc*N/fClk
    val c2 = S*N/2/fClk/fClk

    var cnt = 0
    var sum = 0
    var dstep = 0.0
    var step = 0

    val tx = new ArrayBuffer[Double]()

    while(cnt<N_sample){
      tx.append(romSin(step))
      cnt = cnt + 1
      sum = (cnt + cnt - 1)
      dstep = dstep + (c1+c2*sum)

      step = (dstep.toInt)%N
    }

    val err = (for(idx <- (0 to (N_sample-1))) yield {math.abs(tx_ref(idx)-tx(idx))}).reduce(_+_)
    print(err)
    println("\n")
    println(err/(N_sample))
  }
}
