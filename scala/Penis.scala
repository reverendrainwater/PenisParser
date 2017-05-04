object Penis {
    def main(penis: Array[String]) {
        if (penis.length <= 0) { // Not long enough
            println("GIVE ME A FILE TO FUCK UP");
            return;
        }

        val file = new java.io.File(penis(0));
        val text = scala.io.Source.fromFile(file).mkString;
        println(text.replaceAll("[a-zA-Z0-9]+", "penis"));

        val writer = new java.io.PrintWriter(file);
        writer.write(text.replaceAll("[a-zA-Z0-9]+", "penis"));
        writer.close();
    }
}