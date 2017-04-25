import std.stdio;
import std.string;
import std.file;

void main(string [] args)
{
	if (args.length > 1 && exists(args[1])){
		File file = File(args[1], "r");
		int spaces = 0, newlines = 1;
		while (!file.eof()){
			char[] line = cast(char[]) file.readln();
			foreach (char c; line){
				if (c == ' '){
					spaces++; 
				} else if (c == '\n'){
					newlines++;
				}
			}
		}
		int lines = spaces / newlines;
		while (spaces > -1){
			for (int i = lines; i > -1; i--){
				if (spaces > -1) write("penis ");
				spaces--;
			}
			write("\n");
		}
	} else {
		writeln("YOU DID NOT PROVIDE A FILE YOU IDIOT.");
	}
}
