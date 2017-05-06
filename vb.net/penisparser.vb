Imports System
Imports System.IO


Module Module1
    Sub Main()
        Dim path = Console.ReadLine()
        Dim output = ""
        Dim input = ""
        Try
            Using sr As New StreamReader(path)
                input = sr.ReadToEnd()
            End Using
        Catch e As Exception
            Console.WriteLine("The file could not be read:")
            Console.WriteLine(e.Message)
        End Try
        Dim tokens As String() = input.Split(" ")
        For Each word In tokens
            output += ("penis ")
        Next

        Console.WriteLine(output)
        Console.ReadLine()
    End Sub

End Module
