FileRead, text, text.txt
for Index, Line in StrSplit(text, "`r`n")
	for Index, Word in StrSplit(Line, " "), Out .= "`n"
		Out .= ((Upper := Asc(SubStr(Word, 1, 1))) > 64 && Upper < 91 ? "Penis" : "penis")
			. ((Last := SubStr(Word, 0, 1)) ~= ",|\.|!|\?" ? Last : "") . " "
FileAppend, % Trim(Out, "`n" A_Space), output.txt