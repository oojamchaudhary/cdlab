%{
#include<stdio.h>
int nf=0,p=0,n=0,pf=0;
%}
%%
[+]?[0-9]+[.][0-9]+[/][+]?[0-9]+[.][0-9]+ {pf++;}
[+]?[0-9]+[.][0-9]+[/][-][0-9]+[.][0-9]+ {nf++;}
[-][0-9]+[.][0-9]+[/][+]?[0-9]+[.][0-9]+ {nf++;}
[-]?[0-9]+[.][0-9]+[/][-]?[0-9]+[.][0-9]+ {pf++;}

[+]?[0-9]+[.][0-9]+ {pf++;}
[-][0-9]+[.][0-9]+ {nf++;}

[+]?[0-9]+ {p++;}
[-][0-9]+ {n++;}

# {return 0;}
[ \t\n] ;
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Enter numbers, (use # to end )\n");
    yylex();
    printf("Number of positive integer is= %d\nNumber of negative integer is= %d\nNumber of positive fractions is= %d\nNumber of negative fractions is= %d\n",
           p,n,pf,nf);
}

/*
Steps to compile and run:

1. Save file as prog2.l
2. Run: lex prog2.l
3. Run: gcc lex.yy.c -o prog2
4. Run: ./prog2
5. Enter input and use # to terminate
*/