%{
#include "y.tab.h"
%}
%%
"for" { return FOR; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LF; }
"}" { return RF; }
"=" { return '='; }
"-" { return '-'; }
"+" { return '+'; }
">" { return '>'; }
"<" { return '<'; }
";" { return ';'; }
"==" { return EQ; }
"<=" { return LE; }
">=" { return GE; }
"+=" { return ADDEQ; }
"-=" { return SUBEQ; }
"++" { return INC; }
"--" { return DEC; }
[a-zA-Z]+ { return ALPH; }
[0-9]+ { return NUM; }
[ \t\n] ;
# { return 0; }
. ;
%%
int yywrap(){
    return 1;
}

/*
Steps to compile and run:

1. Save as for.l
2. Save yacc file as for.y
3. Run: yacc -d for.y
4. Run: lex for.l
5. Run: gcc lex.yy.c y.tab.c -ll -o forprog
6. Run: ./forprog
7. Enter input, end with #
*/