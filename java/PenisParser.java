public class PenisParser {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Path to file: ");
        PathToFile = scan.nextLine();

        File file = new File(PathToFile);
        BufferedReader reader = new BufferedREader(newFileReader(file));

        String line = "";
        String old = "";

        while ((line = reader.readLine() != null) {
            String[] split = line.split("\\s+");
            for (String s: split) {
               old += "penis ";
            }
            old += "\r\n";
        }
        reader.close();

        FileWriter writer = new FileWriter(PathToFile);
        writer.write(old);

        write.close();
    }
}
