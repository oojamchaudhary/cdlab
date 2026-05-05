%{
#include<stdio.h>
int lines=1, spaces=0, words=0, characters=0;
%}
%%
[ ] {spaces++; characters++;}         
[\t] {spaces=spaces+3; characters++;} 
[\n] {lines++; characters++;}         
[a-zA-Z]+ {words++; characters=characters+yyleng;} 
. {characters++;}                     
# {return 0;}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("enter a para\n");
    yylex();
    printf("Number of lines = %d, number of spaces = %d, number of words = %d, number of characters = %d\n",
           lines, spaces, words, characters);
}

/*
Steps to compile and run:

1. Save the file as count.l
2. Run: lex count.l
3. Run: gcc lex.yy.c -o count
4. Run: ./count
5. Enter paragraph and press Ctrl+D to stop input
*/