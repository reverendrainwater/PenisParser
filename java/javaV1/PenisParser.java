import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class PenisParser {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Path to file: ");
        String PathToFile = scan.nextLine();

        try {
        File file = new File(PathToFile);
        BufferedReader reader = new BufferedReader(new FileReader(file));

        String line = "";
        String old = "";

        while ((line = reader.readLine()) != null) {
            String[] split = line.split("\\s+");
            for (String s: split) {
               old += "penis ";
            }
            old += "\r\n";
        }
        reader.close();

        FileWriter writer = new FileWriter(PathToFile);
        writer.write(old);

        writer.close();
        }
        catch (IOException ioe) {
            ioe.printStackTrace();
        }
    }
}
