package person

import scala.util.Random

// A user-defined class.
// Arguments of the constructor define the fields of the class.
// If fields are declared with val, they will be immutable.
class Person(var firstName: String
  ,var lastName: String
  ,var gender: String) {

  // An overloaded/auxiliary constructor. An auxiliary constructo must 
  def this(firstName: String, lastName: String) {
    this(firstName, lastName, "X")
  }

  // Public fields.
  var age = 0

  // A private field
  private val socialInsuranceNumber = 100000 + (new Random).nextInt(999999 - 100000)

  def fullName() = s"$firstName $lastName"
  def printFullName() = println(s"$firstName $lastName")
}

// A class that represents a 2D point.
// The constructor has default parameters that default to the origin.
class Point2D (var x: Int = 0, var y: Int = 0) {}