%{
#include <stdio.h>
%}
CAP  [A-Z][a-zA-Z0-9]+
WORD [a-zA-Z0-9]+
%%
{CAP}  {printf("Penis");}
{WORD} {printf("penis");}
%%
void  main() { yylex(); }
int yywrap() { return 1; }
