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

class Vec2DTests extends FunSuite {
  def sumsq(x: Double, y: Double) = pow(x, 2) + pow(y, 2)

  test("the default coordinates of Vec2D are set correctly") {
    val v = new Vec2D()
    assert(v.x == 0 && v.y == 0)
  }

  test("a vector's coordinates can be changed") {
    val v = new Vec2D(2, 1)
    v.x = 3
    v.y = 2
    assert(v.x == 3 && v.y == 2)
  }

  test("the length of a vector is computed correctly") {
    val v = new Vec2D(3.5, 7.3)
    assert(v.length() == sqrt(sumsq(3.5, 7.3)))
  }

  test("a vector can be multiplied by a scalar correctly") {
    val v = (new Vec2D(3.5, 7.3)).multiply(3.1)
    assert(v.x == 3.5 * 3.1 && v.y == 7.3 * 3.1)
  }

  test("a vector can be normalized correctly") {
    val v = new Vec2D(3.5, 7.3)
    val n = v.normalize()
    val len = sqrt(sumsq(3.5, 7.3))
    assert((n.x == 3.5 / len) && (n.y == 7.3 / len))
  }

  test("a vector can be used to move a point") {
    val v = new Vec2D(3.5, 7.3)
    val p1 = new Point2D(6.6, 9.1)
    val p2 = v.movePoint(p1)
    assert(p2.x == 3.5 + 6.6 && p2.y == 7.3 + 9.1)
  }
}