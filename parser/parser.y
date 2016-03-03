%{
#include <stdio.h>
#include <math.h>
#include "../header/tree.h"

int yylex(void);
void yyerror(char*);

%}

%token SPACE
%token TEXT
%token TAG

%%

f	: 	'{' f '}'
	| 	f t
	|	%empty
	;
	

t	:	TAG '[' as ']' '{' f '}'
	|	TAG '{' f '}'
	| 	TEXT
	;
	
as	: 	as a
	|	a
	;
	
a	:	TAG '=' TEXT
	;