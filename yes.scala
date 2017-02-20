object yes {
  def main (args: Array[String]) {
    if (args.length == 0) {
      while (true) {
        println("y")
      }
    }
    else {
      while (true) {
        var i = 0
        var str :String = ""
        for (i <- 0 until args.length) {
          str = str + args(i) + " "
        }
        println(str)
      }
    }
  }
}
