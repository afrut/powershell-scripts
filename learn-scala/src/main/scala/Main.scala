import java.util.Calendar
import java.text.SimpleDateFormat
import scala.io.StdIn.readLine
import scala.collection.mutable.ArrayBuffer
import scala.util.Random
import person.Person

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

  // A method to determine of an integer is odd or even.
  def oddOrEven(p: Int): Boolean = p % 2 match {
    case 0 => true
    case _ => false
  }
  
  // A conditional statement.
  val random = new Random
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
  msg = a < r match {
    case true => "a < r"
    case false => "a >= r"
  }
  log(msg)

  // Another alternative is to use if expressions with case statements
  msg = a match {
    case x if a < r => "a < r"
    case x if a > r => "a > r"
    case x if a == r => "a == r"
  }
  log(msg)

  // The match statement can be used to locate the range in which the value resides
  msg = r match {
    case x if 0 to 4 contains r => "[0,4]"
    case x if 5 to 9 contains r => "[5,9]"
    case x if 10 to 14 contains r => "[10,14]"
    case x if 15 to 19 contains r => "[15,19]"
  }
  log(s"r = $r is in interval $msg")

  // The match statement can be used to infer type.
  def stringOrInt(x: Any): String = x match {
    case s: String => s"$x is a String"
    case i: Int => s"$x is an Int"
    case _ => s"$x neither String nor Int"
  }
  log(stringOrInt(a))
  log(stringOrInt(msg))
  log(stringOrInt(1.1))

  // A for-loop.
  val ls = scala.collection.mutable.ListBuffer.empty[Int]   // a mutable linked-list
  for (cnt <- 0 to 9) {
    ls.addOne(cnt)
  }
  log(ls.toString)

  // Determine the type of variable
  log(s"The type of ls is ${ls.getClass}")

  // A for loop that loops through every element
  var msg = ""
  for (x <- ls) msg += s"$x,"
  log(s"ls = ${msg.dropRight(1)}")    // Drop 1 character starting from the right of string msg

  // A for-expression can be used to a apply a user-defined function to a
  // collection.
  val lsLine = for(x <- ls) yield {linePt(2, 3)(x)}
  log(lsLine.toString)

  // A while loop.
  var found = false
  ls.clear()
  while(!found) {
    r = random.nextInt(10)
    ls.addOne(r)
    found = oddOrEven(r)
  }
  log(s"Found an even number. All numbers generated: ${ls.toString}")

  // Use the foreach method to compute the sum.
  var ret = 0
  ls.foreach(ret += _)
  log(s"ret = $ret")

  // A do-while loop.
  ls.clear()
  do{
    r = random.nextInt(10)
    ls.addOne(r)
    found = oddOrEven(r)
  } while(!found)
  log(s"Found an even number. All numbers generated: ${ls.toString}")

  // Basic exception handling.
  try {
    b = 1/ 0
  } catch {
    case ae: ArithmeticException => log(ae.toString)
  } finally {
    b = 3
  }

  // Create an instance of type Person.
  val person = new Person("John", "Smith")
  log(person.fullName())

  // Create a Tuple
  val tpl1 = ("five", 6, 7)
  log(s"tpl1 = ${tpl1.toString}")

  // A method that returns a Tuple
  def getTuple() = (1, 2, 3, "four")
  val tpl2 = getTuple()
  log(s"tpl2 = ${tpl2.toString}")

  // Unpack a Tuple immediately from a returning function
  val(int1, int2, int3, str1) = getTuple()
  log(s"int1 = $int1, int2 = $int2, int3 = $int3, str1 = $str1")

  // // Get user input
  // println("Enter a number:")
  // val userinput1 = readLine().toInt     // parse string input to integer
  // println("Enter a string:")
  // val userinput2 = readLine()
  // log(s"userinput1 = $userinput1, userinput2 = $userinput2")
}