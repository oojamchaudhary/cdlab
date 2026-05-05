%{
#include "y.tab.h"
%}
%%
"int"|"void"|"char"|"float"|"double" { return TYP; }
"return" { return RETURN; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
"(" { return LP; }
")" { return RP; }
"{" { return LB; }
"}" { return RB; }
";" { return SC; }
"," { return CM; }
"=" { return EQ; }
"+"|"-"|"*"|"/" { return OP; }
[0-9]+ { return NUM; }
[ \t\n] ;
. ;
%%
int yywrap(void) {
    return 1;
}

/*
Steps to compile and run:

1. Save as func.l
2. Save yacc file as func.y
3. Run: yacc -d func.y
4. Run: lex func.l
5. Run: gcc lex.yy.c y.tab.c -ll -o funcprog
6. Run: ./funcprog
7. Enter function and press Ctrl+D
*/