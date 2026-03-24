%%
// Bison parser grammar for C-- language

%{
#include <stdio.h>
#include <stdlib.h>
%}

// Token declarations
%token <int> NUMBER
%token <str> IDENTIFIER
%token PLUS MINUS TIMES DIVIDE
%token ASSIGN SEMICOLON
%token IF ELSE WHILE RETURN

// Operator precedence
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS // Unary minus
%type <int> expression

%%

// Grammar rules
program:
    | program statement
    ;

statement:
    expression SEMICOLON
    | IDENTIFIER ASSIGN expression SEMICOLON
    | IF '(' expression ')' statement
    | IF '(' expression ')' statement ELSE statement
    | WHILE '(' expression ')' statement
    | RETURN expression SEMICOLON
    ;

expression:
    NUMBER
    | IDENTIFIER
    | expression PLUS expression
    | expression MINUS expression
    | expression TIMES expression
    | expression DIVIDE expression
    | '(' expression ')'
    | MINUS expression %prec UMINUS
    ;

%%

// Error handling
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    return yyparse();
}