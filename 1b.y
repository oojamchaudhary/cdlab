%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void yyerror(char const*s);
%}
%start S
%%
S: A B;

A: 'a' A 'b'
 | /* empty */
 ;

B: 'b' B 'c'
 | /* empty */
 ;
%%
int main(){
    printf("Enter words\n");
    yyparse();
    printf("true\n");
    return 0;
}
void yyerror(char const *s){
    fprintf(stderr,"Invalid\n");
    exit(0);
}

/*
Steps to compile and run:

1. Save as prog.y
2. Save lex file as prog.l
3. Run: yacc -d prog.y
4. Run: lex prog.l
5. Run: gcc lex.yy.c y.tab.c -o prog
6. Run: ./prog
7. Enter input string
*/