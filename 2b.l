%{
#include "y.tab.h"
#include<stdlib.h>
extern YYSTYPE yylval;
%}
%%
\n {return 0;}
[0-9]+ {yylval=atoi(yytext); return NUM;}
[-+*/()] {return yytext[0];}
. {return yytext[0];}
%%
int yywrap(){
    return 1;
}

/*
Steps to compile and run:

1. Save as expr.l
2. Save yacc file as expr.y
3. Run: yacc -d expr.y
4. Run: lex expr.l
5. Run: gcc lex.yy.c y.tab.c -ll -o expr
6. Run: ./expr
7. Enter expression
*/