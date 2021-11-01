// A simple library to represent 2D points and vectors
package mathlib2d
import math.sqrt
import math.pow

class Point2D (var x: Double = 0, var y: Double = 0) {
  def distanceTo(other: Point2D) = sqrt(pow(x - other.x, 2) + pow(y - other.y, 2))
  def fastDistanceTo(other: Point2D) = pow(x - other.x, 2) + pow(y - other.y, 2)
}

class Vec2D (var x: Double = 0, var y: Double = 0) {

}