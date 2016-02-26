%{
#include <stdio.h>
#include <math.h>
#include "../header/variables.h"

int yylex(void);
void yyerror(char*);
int last_ret;

variables_list* vl;
%}

%token <value> NUM
%token PUI
%token <name> IDENTIFIER

%union {
	int value;
	char* name;
}

%type <value> e t p f s

%%

calculs	:	calculs s ';' 	{printf("%d\n", $2);}
		|	
		;

s 		: 	IDENTIFIER '=' e 	{ 
	variable var = create_variable($1, $3);
	variables_list_insert(vl, var);
	$$ = $3;
}
		| 	e '?' e ':' e 		{ if ($1) $$ = $3; else $$ = $5; } 
		| 	e					{ $$ = $1; }
		;

e		:	e '+' t		{$$= $1 + $3;}
		| 	e '-' t		{$$= $1 - $3;}
		|	t			{ $$ = $1; }
		;

t		: 	t '*' p		{$$= $1 * $3;}
		| 	t '/' p		{if ($3 == 0) return 10;   else $$= $1 / $3;}
		| 	t '%' p		{$$= $1 % $3;}
		| 	p			{ $$ = $1; }
		;

p		:	f PUI p		{ $$= pow($1,$3);}
		|	f			{ $$ = $1; }
		;

f		: 	'(' e ')'	{ $$ = $2; }
		| 	NUM			{ $$ = $1; }
		|	IDENTIFIER  { 
	variable var = variables_list_find(vl, $1);
	if (var != NULL){
		$$ = var->value;
	} else {
		return 11;
	}
}
		;

%%