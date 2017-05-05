using System;
using System.IO;
using System.Text.RegularExpressions;

namespace ConsoleApplication
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            if (args.Length < 1)
            {
                Console.WriteLine("Must provide File name as argument for parsing");
                return;
            }

            String file = args[0];
            if (!File.Exists(file))
            {
                Console.WriteLine("Provided file does not exist! File: " + file);
                return;
            }

            Regex regex = new Regex("\\S+");
            StreamWriter output = new StreamWriter("output.penis");

            foreach (String line in File.ReadAllLines(file))
            {
                output.WriteLine(regex.Replace(line, "penis"));
            }
            output.Close();

            Console.WriteLine("Successfully parsed file!");
        }
    }
}