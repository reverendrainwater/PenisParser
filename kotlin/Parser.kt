import java.io.File

fun main(args: Array<String>)
{
    if (args.size < 1)
    {
        println("Must provide file name as argument for parsing!")
        return
    }

    val file = File(args[0])
    if (!file.exists())
    {
        println("Provided file does not exist! File: ${file.absolutePath}")
        return
    }

    File("output.penis").writeText(file.readText().replace(Regex("\\S+"), "penis"))

    println("Successfully parsed file")
}