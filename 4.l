%{
#include "y.tab.h"
#include<stdio.h>
extern YYSTYPE yylval;
%}
%%
[0-9]+ { yylval.sym = yytext[0]; return NUMBER; }
[a-zA-Z]+ { yylval.sym = yytext[0]; return LETTER; }
\n { return 0; }
. { return yytext[0]; }
%%
int yywrap() { return 1; }

/*
Steps to compile and run:

1. Save as code.l
2. Save yacc file as code.y
3. Run: yacc -d code.y
4. Run: lex code.l
5. Run: gcc lex.yy.c y.tab.c -ll -o codegen
6. Run: ./codegen
7. Enter expression (e.g., a=b+c;)
*/