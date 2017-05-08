import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Created by Wayne on 5/7/2017.
 */
public class PenisParser3 {

    public static void main(String[] args) {
        if (args.length > 0) {
            try {
                Files.readAllLines(Paths.get(args[0])).forEach(line -> System.out.print(line.replaceAll("(\\w+)", "penis")));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("You should probably enter a file name");
        }
    }
}
