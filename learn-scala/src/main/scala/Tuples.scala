// A package that demonstrates tuples in scala
package tuples

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Tuples")
    println("----------------------------------------------------------------------")

    // Create a Tuple
    val tpl1 = ("five", 6, 7)
    println("Defining a tuple:")
    println(s"    tpl1 = ${tpl1.toString}")

    // A method that returns a Tuple
    def getTuple() = (1, 2, 3, "four")
    println("Returning a tuple from a function:")
    val tpl2 = getTuple()
    println(s"    tpl2 = ${tpl2.toString}")

    // Unpack a Tuple immediately from a returning function
    val(int1, int2, int3, str1) = getTuple()
    println("Unpacking a tuple from a function into different variables:")
    println(s"    int1 = $int1, int2 = $int2, int3 = $int3, str1 = $str1")

    println()
  }
}