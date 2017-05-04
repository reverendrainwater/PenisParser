using System;
using System.IO;
using System.Text;

namespace PenisParser
{
    class Penis
    {
        static void Main(string[] args)
        {
            Console.Write("Path to file: ");
            var filePath = Console.ReadLine();

            if (File.Exists(filePath))
            {
                try
                {
                    StringBuilder builder = new StringBuilder();
                    using (StreamReader reader = new StreamReader(File.OpenRead(filePath)))
                    {
                        string line = "";
                        while ((line = reader.ReadLine()) != null)
                        {
                            var split = line.Split(new[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                            foreach (var s in split)
                            {
                                builder.Append("penis ");
                            }
                            builder.Append("\r\n");
                        }
                    }
                    using (StreamWriter writer = new StreamWriter(File.Open(filePath, FileMode.Create)))
                    {
                        writer.Write(builder.ToString());
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }
            else
            {
                Console.WriteLine("File not found");
            }
        }
    }
}
