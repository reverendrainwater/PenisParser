FileRead, text, text.txt
for LineIndex, Line in StrSplit(text, "`r`n")
	for WordIndex, Word in StrSplit(Line, " "), Out .= ("`n", LineIndex > 1 ? Out := SubStr(Out, 1, StrLen(Out) - 1) : "")
		Out .= ((Upper := Asc(SubStr(Word, 1, 1))) > 64 && Upper < 91 ? "Penis" : "penis") 
			. ((Last := SubStr(Word, 0, 1)) ~= ",|\.|!|\?" ? Last : "") . " "
FileAppend, % Trim(Out, "`n" A_Space), output.txt