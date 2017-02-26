#!/usr/bin/env scala

object yes {
  def main (args: Array[String]) {
    val output = if (args.isEmpty) { "y" } else { args.mkString(" ") }
    while (true) {
      println(output)
    }
  }
}
