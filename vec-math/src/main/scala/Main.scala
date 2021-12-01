import veclib2d.Point2D
import veclib2d.Vec2D

object Main extends App {
  val p1 = new Point2D()
  println(p1)
  println(p1.distanceTo(new Point2D(1,1)))
  println(p1.fastDistanceTo(new Point2D(2, 2)))
  val v1 = new Vec2D(1, 2)
  println(v1.length())
  println(v1.multiply(2))
  println(v1.normalize())
  println(v1.movePoint(new Point2D(4, 5)))
}
