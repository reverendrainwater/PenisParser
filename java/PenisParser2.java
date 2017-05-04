import java.io.File;
import java.io.IOException;
import java.nio.file.*;

public class PenisParser2
{
    public static void main(String[] args) throws IOException
    {
        if (args.length < 1)
        {
            System.out.println("Must provide file name as argument for parsing!");
            return;
        }

        File file = new File(args[0]);
        if (!file.exists())
        {
            System.out.printf("Provided file does not exist! File: %s\n", file.getAbsolutePath());
            return;
        }

        Path output = Paths.get("output.penis");
        String content = new String(Files.readAllBytes(file.toPath()));
        Files.write(output, content.replaceAll("\\S+", "penis").getBytes(), StandardOpenOption.CREATE);

        System.out.println("Successfully parsed file!");
    }
}
