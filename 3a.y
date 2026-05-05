%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int count = 0;
int error=0;
int yyerror();
%}
%token FOR LPAREN RPAREN LF RF ALPH NUM EQ LE GE ADDEQ SUBEQ INC DEC
%%
S : I
;

I : FOR A B {count++; }
;

A : LPAREN E ';' E ';' E RPAREN
;

E : ALPH Z NUM
  | ALPH Z ALPH
  | ALPH U
  | /* empty */
;

Z : '='
  | '>'
  | '<'
  | LE
  | GE
  | EQ
  | ADDEQ
  | SUBEQ
;

U: INC
 | DEC
;

B : LF B RF
  | I
  | ALPH
  | ALPH I
  | /* empty */
;
%%
int main() {
    yyparse();
    if(error){
        printf("error");
    }
    else{
        printf("valid\n");
    }
    printf("Number of nested FOR's are: %d\n", count);
    return 0;
}
int yyerror() {
    error=1;
    exit(0);
}

/*
Steps to compile and run:

1. Save as for.y
2. Save lex file as for.l
3. Run: yacc -d for.y
4. Run: lex for.l
5. Run: gcc lex.yy.c y.tab.c -ll -o forprog
6. Run: ./forprog
7. Enter code and terminate with #
*/