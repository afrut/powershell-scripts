// A package that demonstrates reading user input from stdin in scala
package userinput
import scala.io.StdIn.readLine

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  User Input")
    println("----------------------------------------------------------------------")

    // Get user input
    println("Enter a number:")
    val userinput1 = readLine().toInt     // parse string input to integer
    println("Enter a string:")
    val userinput2 = readLine()
    println(s"    userinput1 = $userinput1, userinput2 = $userinput2")

    println()
  }
}