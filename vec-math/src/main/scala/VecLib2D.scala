// A library to use scalatest on
// A library to do simple vector math
package veclib2d

import scala.math.sqrt
import scala.math.pow
import func.Func.sumsq

class Point2D(
  var x: Double = 0,
  var y: Double = 0
)
{
  def distanceTo(other: Point2D): Double =
    sqrt(sumsq(this.x - other.x, this.y - other.y))

  def fastDistanceTo(other: Point2D): Double =
    sumsq(this.x - other.x, this.y - other.y)

  override def toString: String = s"(${this.x}, ${this.y})"
}

class Vec2D(
  var x: Double = 0,
  var y: Double = 0
)
{
  def length(): Double = sqrt(sumsq(this.x, this.y))
  def multiply(s: Double): Vec2D = new Vec2D(this.x * s, this.y * s)
  def normalize(): Vec2D = this.multiply(1 / this.length())
  def movePoint(source: Point2D): Point2D = new Point2D(source.x + this.x, source.y + this.y)

  override def toString: String = s"(${this.x}, ${this.y})"
}