%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*
WS [ \t\n]
STRING \"[^\"]*\"

%%
"int" { return INT; }
"main" { return MAIN; }
"printf" { return PRINTF; }

{STRING} { yylval.str = strdup(yytext); return STRING; }
{ID} { yylval.id = strdup(yytext); return ID; }
{DIGIT}+ { yylval.num = atoi(yytext); return NUM; }

"+" { return ADD; }
"=" { return ASSIGN; }
"(" { return LPAREN; }
")" { return RPAREN; }
";" { return SEMI; }
"," { return COMMA; }
"{" { return LBRACE; }
"}" { return RBRACE; }

{WS} ;
. ;
%%

int yywrap() {
    return 1;
}

/*
Steps to compile and run:

1. Save as program1.l
2. Save yacc file as program1.y
3. Run: yacc -d program1.y
4. Run: lex program1.l
5. Run: gcc lex.yy.c y.tab.c -ll -o output
6. Run:
   echo 'int main(){int a=5;int b=10; a=a+b; printf("Sum %d\n",a);}' | ./output
*/