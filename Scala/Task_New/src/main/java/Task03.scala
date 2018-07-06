import java.io.{BufferedWriter, FileNotFoundException, FileWriter}

import org.apache.log4j.{Logger, PropertyConfigurator}

import scala.io.Source

object Task03 {
  def main(args: Array[String]): Unit = {

    val LOGGER = Logger.getLogger(Task01.getClass)

    try {

      PropertyConfigurator.configure("src/log4j.properties")

      val file = Source.fromFile("Scala Task 01.txt") //read file
      val x = file.getLines().toList.flatten //make flat map to get each character seperate
      LOGGER.info("Task 03 - Number of characters in the file : " + x.length)

      val y = x.filter (i => x.indexOf (i) == x.lastIndexOf (i))
      LOGGER.info("Task 03 - Number of unique characters in the file : " + y.length)

//      val file2 = "TaskResult.txt"
//      val writer = new BufferedWriter(new FileWriter(file2))
      LOGGER.info("Task 03 - Number of unique characters in the file : " + y.length + "\n" + y) //print result to a text file
//      writer.close

      val z = x.groupBy(identity).mapValues(_.size) //occurance for each character in a Map
      LOGGER.info("Task 03 - "+ z)

    }catch{
      case e: FileNotFoundException => LOGGER.error("No file found")
    }
  }
}