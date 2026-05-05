%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}
%token TYP ID LP RP LB RB SC CM EQ OP RETURN NUM
%left OP
%left EQ
%%
prog: funcs ;

funcs: func
     | funcs func
     ;

func: TYP ID LP params RP LB stmts RB {
    printf("Function is syntactically correct.\n");
}
;

params: /* empty */
      | param_list
      ;

param_list: param
          | param_list CM param
          ;

param: TYP ID ;

stmts: stmt
     | stmts stmt
     ;

stmt: var_decl
    | expr SC
    | RETURN expr SC
    ;

var_decl: TYP ID SC
        | TYP ID EQ expr SC
        ;

expr: ID
    | NUM
    | ID EQ expr
    | expr OP expr
    | LP expr RP
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main(void) {
    return yyparse();
}

/*
Steps to compile and run:

1. Save as func.y
2. Save lex file as func.l
3. Run: yacc -d func.y
4. Run: lex func.l
5. Run: gcc lex.yy.c y.tab.c -ll -o funcprog
6. Run: ./funcprog
7. Enter input (Ctrl+D to end)
*/