import java.util.Calendar
import java.text.SimpleDateFormat

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
    val dt = Calendar.getInstance().getTime()
    val fmt = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    println(s"${fmt.format(dt)}: $msg")
  }
  log(s"a = $a")
  
  // A conditional statement.
  val random = new scala.util.Random
  var r = 0 + random.nextInt(20)
  log(s"r = $r")
  if(a < r) {
    log("a < r")
  }
  else if(a > r) {
    log("a > r")
  }
  else {
    log("a == r")
  }

  // if/else returns a value
  val c = if (a > r) a else r
  log(s"r = $r")

  // Alternatively, a match statement can be used.
  var msg = a < r match {
    case true => "a < r"
    case false => "a >= r"
  }
  log(msg)

  // The match statement can be used to infer type.
  def stringOrInt(x: Any): String = x match {
    case s: String => s"$x is a String"
    case i: Int => s"$x is an Int"
    case _ => s"$x neither String nor Int"
  }
  log(stringOrInt(a))
  log(stringOrInt(msg))
  log(stringOrInt(1.1))

  // A for-loop
  val ls = scala.collection.mutable.ListBuffer.empty[Int]   // a mutable linked-list
  for (cnt <- 0 to 9) {
    ls.addOne(cnt)
  }
  log(ls.toString)

  // A for-expression can be used to a apply a user-defined function to a
  // collection
  val lsLine = for(x <- ls) yield {linePt(2, 3)(x)}
  log(lsLine.toString)

}