#!/usr/bin/env swift
import Foundation

// ---- Argument Handling ------------------------------------------------------
guard CommandLine.arguments.count > 1 else {
    print("Yo, you absolute cockwomble! Feed me a file name or I'll ram a penis-shaped error code up your terminal!")
    exit(1)
}

let fileURL = URL(fileURLWithPath: CommandLine.arguments[1])

// ---- File Reading & Penisification ------------------------------------------
do {
    let text = try String(contentsOf: fileURL, encoding: .utf8)
    let penisified = text.replacingOccurrences(
        of: #"(\w+)"#,
        with: "penis",
        options: .regularExpression 
    )
    
    print("penis ", terminator: "")
    print(penisified)
    print("\n\nBow down, you filthy word-wrecker! Your file's now a glistening shrine to penis supremacy!")

} catch let error as NSError {
    let reason = (error.userInfo[NSUnderlyingErrorKey] as? NSError)?.localizedDescription ?? error.localizedDescription
    print("You slippery dick-tickler! That file's ghosting me harder than a tinder date: \(reason)")
    exit(1)
}