// A package that demonstrates basics in scala
package basics

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Basics")
    println("----------------------------------------------------------------------")

    // Type declarations are optional.
    val a: Int = 10     // a cannot be modified (immutable).
    var b = 2           // b can be modified.
    b = 3
    println(s"a = $a")
    println(s"b = ${b}") 

    // Expressions can be surrounded by blocks.
    println(s"x = ${
      val x = 10
      x + 1
    }")

    println()
  }
}