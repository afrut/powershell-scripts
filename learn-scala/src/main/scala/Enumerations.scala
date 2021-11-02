// A package that demonstrates enumerations in scala
package enumerations

object Main {
  def run(): Unit = {
    println("----------------------------------------------------------------------")
    println("  Enumerations")
    println("----------------------------------------------------------------------")

    // Create an enumeration.
    sealed trait Month
    case object January extends Month
    case object February extends Month
    case object March extends Month
    case object April extends Month
    case object May extends Month
    case object June extends Month
    case object July extends Month
    case object August extends Month
    case object September extends Month
    case object October extends Month
    case object November extends Month
    case object December extends Month

    // Try to parse strings of the format yyyy-mm-dd.
    val str = "2019-07-23"
    val foo = str.split("-")
    val year = foo(0).toInt
    val month  = foo(1) match {
      case "01" => "January"
      case "02" => "February"
      case "03" => "March"
      case "04" => "April"
      case "05" => "May"
      case "06" => "June"
      case "07" => "July"
      case "08" => "August"
      case "09" => "September"
      case "10" => "October"
      case "11" => "November"
      case "12" => "December"
      case _ => "InvalidMonth"
    }
    val day = foo(2).toInt
    println(s"$str = $month $day, $year")

    // println(year)
    // println(month)
    // println(day)

    println()
  }
}