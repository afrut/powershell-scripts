// A package that demonstrates exception handling in scala
package exceptionhandling

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Exception Handling")
    println("----------------------------------------------------------------------")
    val a = 10
    var b = 2
    println(s"a = $a")
    println(s"b = ${b}")

    // Basic exception handling.
    try {
      println("Try to divide by 0:")
      b = 1/ 0
    } catch {
      case x: ArithmeticException => println(s"    ${x.toString}")
    } finally {
      // Code that should run regardless of error.
      b = 3
    }
    println()
  }
}