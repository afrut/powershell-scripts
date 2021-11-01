// A package that demonstrates control structures in scala
package controlstructures
import functionsandmethods.Main._

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Control Structures")
    println("----------------------------------------------------------------------")

    val a = 10
    var b = 2
    println(s"a = $a")
    println(s"b = ${b}")

    // A conditional statement.
    var r = getRandomInt(0, 20)
    println(s"Generated random number r = $r")
    var msg = ""
    if(a < r) {
      msg = "a < r"
    }
    else if(a > r) {
      msg = "a > r"
    }
    else {
      msg = "a == r"
    }
    println(s"    $msg")

    // if/else returns a value
    val c = if (a > r) a else r
    println(s"    max(a, r) = $c")

    // Alternatively, a match statement can be used.
    msg = a < r match {
      case true => "a < r"
      case false => "a >= r"
    }
    println(s"    $msg")

    // Another alternative is to use if expressions with case statements
    msg = a match {
      case x if a < r => "a < r"
      case x if a > r => "a > r"
      case x if a == r => "a == r"
    }
    println(s"    $msg")

    // The match statement can be used to locate the range in which the value resides
    msg = r match {
      case x if 0 to 4 contains r => "[0,4]"
      case x if 5 to 9 contains r => "[5,9]"
      case x if 10 to 14 contains r => "[10,14]"
      case x if 15 to 19 contains r => "[15,19]"
    }
    println(s"    r = $r is in interval $msg")

    // The match statement can be used to infer type.
    def stringOrInt(x: Any): String = x match {
      case s: String => s"$x is a String"
      case i: Int => s"$x is an Int"
      case _ => s"$x neither String nor Int"
    }
    println("Using match to determine type:")
    println(s"    ${stringOrInt(a)}")
    println(s"    ${stringOrInt(msg)}")
    println(s"    ${stringOrInt(1.1)}")

    // A for-loop.
    val ls = scala.collection.mutable.ListBuffer.empty[Int]   // a mutable linked-list
    for (cnt <- 0 to 9) {
      ls.addOne(cnt)
    }
    println("Created a mutable ListBuffer:")
    println(s"    ls = ${ls.toString}")

    // A for loop that loops through every element
    msg = ""
    for (x <- ls) msg += s"$x,"
    println(s"    ls = ${msg.dropRight(1)}")  // Drop 1 character starting from the right of string msg
    
    // A for-expression can be used to a apply a user-defined function to a
    // collection.
    val lsLine = for(x <- ls) yield {line(2, 3)(x)}
    println("Computed another ListBuffer based on ls:")
    println(s"    lsLine = ${lsLine.toString}")

    // A while loop.
    println("Using a while to keep generating numbers until an even number is found:")
    var found = false
    ls.clear()
    var ret = 0
    while(!found) {
      ret = getRandomInt(10)
      ls.addOne(ret)
      found = oddOrEven(ret)
    }
    println(s"    Found an even number = $ret. All numbers generated: ${ls.toString}")

    // Use the foreach method to compute the sum.
    ret = 0
    ls.foreach(ret += _)
    println(s"    Sum of all numbers generated = $ret")

    ls.clear()
    println("Using a do-while to keep generating numbers until an even number is found:")
    do{
      ret = getRandomInt(10)
      ls.addOne(ret)
      found = oddOrEven(ret)
    } while(!found)
    println(s"    Found an even number ret = $ret. All numbers generated: ${ls.toString}")

    println()
  }
}