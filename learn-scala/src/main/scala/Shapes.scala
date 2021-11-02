// A package that demonstrates traits in scala
package shapes
import scala.math.Pi
import scala.math.sqrt
import functionsandmethods.Main.getRandomInt
import scala.collection.mutable.ListBuffer

// Define some traits. Although now shown here, traits can be defined
// with concrete implementations of its methods.
trait Shape {
  def area(): Double
}

trait Polygon {
  def perimeter(): Double
}

// Extend both the Shape and Polygon traits.
class Triangle(val b: Double, val h: Double) extends Shape with Polygon {
  override def area(): Double = 0.5 * b * h
  override def perimeter(): Double = {
    // Assume isosceles triangle
    val s1 = (1/ 2) * b
    val s2 = h
    val c = sqrt((s1 * s1) + (s2 * s2))
    b + (2 * c)
  }
}

class Square(val s: Double) extends Shape with Polygon {
  override def area(): Double = s * s
  override def perimeter(): Double = 4 * s
}

class Rectangle(val l: Double, val w: Double) extends Shape with Polygon {
  override def area(): Double = l * w
  override def perimeter(): Double = (l + w) * 2
}

// Circle is not a polygon. Extend only the shape trait.
class Circle(val r: Double) extends Shape {
  override def area(): Double = Pi * r * r / 2
}

// Define an abstract class.
abstract class EquilateralPolygon(val s: Double) extends Polygon {
  def perimeter(): Double
}

// Extend an abstract class.
class EquilateralTriangle(s: Double) extends EquilateralPolygon(s) {
  def perimeter(): Double = 3 * s
}

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Traits and Abstract Classes")
    println("----------------------------------------------------------------------")
    val triangle = new Triangle(2, 3)
    val square = new Square(4)
    val rectangle = new Rectangle(5, 6)
    val circle = new Circle(7)
    val eqTriangle = new EquilateralTriangle(3)
    println(s"triangle area = ${triangle.area()}")
    println(s"square area = ${square.area()}")
    println(s"rectangle area = ${rectangle.area()}")
    println(f"circle area = ${circle.area()}%.2f")
    println(s"triangle perimeter = ${triangle.perimeter()}")
    println(s"square perimeter = ${square.perimeter()}")
    println(s"rectangle perimeter = ${rectangle.perimeter()}")
    println(s"equilateral triangle perimeter = ${eqTriangle.perimeter()}")

    println()
  }
}