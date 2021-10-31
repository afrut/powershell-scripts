import java.util.Calendar

object Main extends App {
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

  // Define an anonymous function.
  val timesTwo = (x: Int) => x * 2
  val add = (x: Int, y: Int) => x + y
  println(s"timesTwo(a) = ${timesTwo(a)}")
  println(s"add(a, b) = ${add(a, b)}")

  // Define a method.
  def linePt(m: Int, b: Int)(x: Int): Int = {
    (m * x) + b         // last line is the return
  }
  println(s"linePt(2,1)(a) = ${linePt(2,1)(a)}")

  // A method with no return value.
  def log(msg: String): Unit = {
    println(s"${Calendar.getInstance().getTime()}: $msg")
  }
  log(s"a = $a")
  
  // A conditional statement.
  val random = new scala.util.Random
  var r = 0 + random.nextInt(20)
  println(s"r = $r")
  if(a < r) {
      println("a < r")
  }
  else if(a > r) {
    println("a > r")
  }
  else {
    println("a == r")
  }

  // if/else returns a value
  val c = if (a > r) a else r
  println(s"r = $r")
}