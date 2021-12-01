package veclib2dtest

import org.scalatest.FunSuite
import scala.math.sqrt
import scala.math.pow

import veclib2d.Point2D
import veclib2d.Vec2D

class Point2DTests extends FunSuite {
  def sumsq(x: Double, y: Double) = pow(x, 2) + pow(y, 2)

  test("the default coordinates of Point2D are set correctly") {
    val pt = new Point2D()
    assert(pt.x == 0 && pt.y == 0)
  }

  test("a point's coordinates can be changed") {
    val pt = new Point2D()
    pt.x = 3
    pt.y = 2
    assert(pt.x == 3 && pt.y == 2)
  }

  test("distance to another point is calculated correctly") {
    val p1 = new Point2D(1.2, 5.3)
    val p2 = new Point2D(7.7, 3.4)

    assert(p1.distanceTo(p2) == sqrt(sumsq(1.2 - 7.7, 5.3 - 3.4)))
  }

  test("fast distance to another point is calculated correctly") {
    val p1 = new Point2D(1.2, 5.3)
    val p2 = new Point2D(7.7, 3.4)
    assert(p1.fastDistanceTo(p2) == sumsq(1.2 - 7.7, 5.3 - 3.4))
  }
}