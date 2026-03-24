/* Bison grammar for C-- compiler */

%{
#include <stdio.h>
#include <stdlib.h>
#include "ast.h"
%}

%token INT FLOAT STRING BOOL
%token ADD SUB MULT DIV
%token SEMICOLON COMMA LPAREN RPAREN LBRACE RBRACE
%token IF ELSE WHILE RETURN
%type <node> expression statement

%%

program:
    | program statement
    ;

statement:
    expression SEMICOLON {
        /* Handle the statement */
    }
    | IF LPAREN expression RPAREN statement ELSE statement {
        /* Handle if-else statement */
    }
    | WHILE LPAREN expression RPAREN statement {
        /* Handle while loop */
    }
    | RETURN expression SEMICOLON {
        /* Handle return statement */
    }
    ;

expression:
    INT {
        $$ = createIntNode($1);
    }
    | FLOAT {
        $$ = createFloatNode($1);
    }
    | STRING {
        $$ = createStringNode($1);
    }
    | ADD expression expression {
        $$ = createAddNode($2, $3);
    }
    | SUB expression expression {
        $$ = createSubNode($2, $3);
    }
    | MULT expression expression {
        $$ = createMultNode($2, $3);
    }
    | DIV expression expression {
        $$ = createDivNode($2, $3);
    }
    ;

%%

int main(void) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
