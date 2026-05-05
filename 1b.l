%{
#include "y.tab.h"
%}
%%
\n {return 0;}
a {return 'a';}
b {return 'b';}
c {return 'c';}
. {return yytext[0];}
%%
int yywrap(){
    return 1;
}

/*
Steps to compile and run:

1. Save as prog.l
2. Save yacc file as prog.y
3. Run: yacc -d prog.y
4. Run: lex prog.l
5. Run: gcc lex.yy.c y.tab.c -o prog
6. Run: ./prog
7. Enter string and press Enter
*/