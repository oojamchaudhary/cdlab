%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S : I {printf("Result is %d\n",$1); };

I: I '+' I {$$=$1+$3;}
 | I '-' I {$$=$1-$3;}
 | I '/' I {if($3==0){yyerror();}else{$$=$1/$3;}}
 | I '*' I {$$=$1*$3;}
 | '(' I ')' {$$=$2;}
 | NUM {$$=$1;}
 | '-' NUM {$$=-$2;}
 ;
%%
int main(){
    printf("Enter an expression\n");
    yyparse();
    printf("Valid\n");
    return 0;
}
void yyerror(){
    printf("Invalid\n");
    exit(0);
}

/*
Steps to compile and run:

1. Save as expr.y
2. Save lex file as expr.l
3. Run: yacc -d expr.y
4. Run: lex expr.l
5. Run: gcc lex.yy.c y.tab.c -ll -o expr
6. Run: ./expr
7. Enter expression
*/