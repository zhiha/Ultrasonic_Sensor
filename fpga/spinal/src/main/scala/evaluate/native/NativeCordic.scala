package evaluate.native

import org.jetbrains.annotations.TestOnly


/**
 * @author zw-yao
 * @version 1.0
 */
object NativeCordic {

  def main(args: Array[String]): Unit = {
    Funcsim()
  }

  def Funcsim(): Unit ={
    val tableDepth = 32
    val tableContent = for(idx <- 0 to (tableDepth-1)) yield {
      (math.atan(math.pow(2,-idx)))*180/(math.Pi)
    }

    val K = (tableContent.map(x => math.cos(x/180*math.Pi))).reduce(_*_)
    println(s"K is ${K}")

    val targetTheta = 60

    var x = 1.toDouble
    var y = 0.toDouble
    var z = targetTheta.toDouble

    var iter = tableDepth
    var idx = 0
    while(idx < iter){
      var x_cur = x
      var y_cur = y
      if(z > 0){
        x = x_cur - math.pow(2,-idx)*y_cur
        y = y_cur + math.pow(2,-idx)*x_cur
        z = z - tableContent(idx)
      }
      else{
        x = x_cur + math.pow(2,-idx)*y_cur
        y = y_cur - math.pow(2,-idx)*x_cur
        z = z + tableContent(idx)
      }
      idx = idx + 1
    }

    x = K * x
    y = K * y

    print(s"ref value: ${math.cos(targetTheta*math.Pi/180)}, result value: ${x} \n")

    println(math.cos(targetTheta*math.Pi/180))
  }
}
