using System;
using System.IO;
using System.Text.RegularExpressions;

public class PenisParser
{
    public static void Main(string[] args)
    {
        // Checks if there's only one command line argument
        if (args.Length != 1)
        {
            Console.Error.WriteLine("Just one command line argument por favor");
            System.Environment.Exit(1);
        }

        StreamReader reader;
        StreamWriter writer;
        string newContent = "";
        string currentLine;

        // Checks if the file is valid
        try
        {
            reader = new StreamReader(args[0]);
            while ((currentLine = reader.ReadLine()) != null)
            {
                // Replace all the words in the current line and adds it to newContent
                newContent += Regex.Replace(currentLine, "[a-zA-Z0-9]+", "penis") + "\n";
            }
            reader.Close();

            // Writes the new content to the file and prints it out on the command line
            writer = new StreamWriter("result.txt");
            writer.Write(newContent);
            writer.Flush();
            writer.Close();
            Console.WriteLine(newContent);
        }
        catch (FileNotFoundException)
        {
            Console.Error.WriteLine("Wrong file boi");
            System.Environment.Exit(1);
        }
        catch (Exception)
        {
            Console.Error.WriteLine("Something else went wrong boi");
            System.Environment.Exit(1);
        }
    }
}
