%{
#include <stdio.h>
#include <math.h>
#include "../header/tree.h"

int yylex(void);
void yyerror(char*);

%}

%token SPACE

%%

e : 
  ;