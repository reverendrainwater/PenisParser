% prints a list of penis representing the words in a file.
main:- 
    open('text.txt',read,Stream), 
    readWords(Stream,List_of_words),
    close(Stream),
    length(List_of_words, Length),
    build('penis', Length, Penis_list),
    write(Penis_list), nl. 

% Build a list of X's of length N1
build(_,0,[]).
build(X,N1,[X|L]) :- N1 > 0, N is N1 - 1, build(X,N,L). 

% Read all the words in a list, defined to be tokens with deliminator
% of a space, new line, or end of file
readWords(Stream, []) :- at_end_of_stream(Stream).
readWords(Stream, [H | T]) :-
    \+ at_end_of_stream(Stream),
    readWord(Stream, H),
    readWords(Stream, T).

% read a single word
readWord(InStream,W) :-
    get_code(InStream,Char), 
    checkCharAndReadRest(Char,Chars,InStream), 
    atom_codes(W,Chars). 

% newline
checkCharAndReadRest(10,[],_):-  !.
% space
checkCharAndReadRest(32,[],_):-  !.
% eof
checkCharAndReadRest(-1,[],_):-  !. 
checkCharAndReadRest(end_of_file,[],_):-  !. 
% tokenizes the input stream
checkCharAndReadRest(Char,[Char|Chars],InStream):- 
    get_code(InStream,NextChar), 
    checkCharAndReadRest(NextChar,Chars,InStream).
