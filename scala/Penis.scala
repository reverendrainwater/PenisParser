object Penis {
    def main(penis: Array[String]) {
        if (penis.length <= 0) { // Not long enough
            println("GIVE ME A FILE TO FUCK UP");
            return;
        }

        val file = new java.io.File(penis(0));

        if (!file.exists) {
            println("GIVE ME A REAL FILE TO FUCK UP");
            return;
        }

        val text = scala.io.Source.fromFile(file).mkString;

        val writer = new java.io.PrintWriter(file);
        writer.write(text.replaceAll("\\S+", "penis"));
        writer.close();
    }
}
