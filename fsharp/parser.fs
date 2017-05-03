(*
   Many ideas for the railroading of result error handler comes from
   http://fsharpforfunandprofit.com/posts/recipe-part2/
*)
open System
open System.IO
open System.Text.RegularExpressions

type Result<'TSuccess, 'TFailure> =
    | Success of 'TSuccess
    | Failure of 'TFailure

//Translation between result and input for next function in railroad.
let bind func input =
    match input with
    | Success s -> func s
    | Failure f -> Failure f

//Creates a operator to encapsulate the concept of '>> bind'
let (>=>) func1 func2 =
    func1 >> (bind func2)

//Retrieves the path of the file to parse.
let getFileArg (args : string[]) =
    if args.Length < 1 then
        Failure "Provide path to file to parse as argument!"
    else
        Success args.[0]

//Determines if the exists.
let fileExists file =
    if not(File.Exists(file)) then
        Failure (sprintf "File doesn't exist: %s" file)
    else
        Success file

let convertFile file =
    let output = new StreamWriter("output.penis")
    let regex = new Regex("\S+")
    
    File.ReadAllLines(file)
    |> Seq.iter (fun line -> output.WriteLine(regex.Replace(line, "penis")))
    
    output.Close ()
    Success "File successfully penisified!"
 
let parseFile =
    getFileArg
    >=> fileExists
    >=> convertFile
        
[<EntryPoint>]
let main (args : string[]) =
    let result = parseFile args
    match result with
    | Success s -> printfn "%s" s
    | Failure f -> printfn "%s" f
    
    0

