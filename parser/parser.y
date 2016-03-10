%{
/*	GRAMMAIRE
CONTENU							->	CONTENU MOT
CONTENU							->	CONTENU LIAISON
CONTENU							->	LIAISON
CONTENU							->	MOT

ATTRIBUT	->	ETIQUETTE '=' CONTENU

BLOCATTRIBUT	-> BLOCATTRIBUT ATTRIBUT | ATTRIBUT

BLOC		->	ETIQUETTE '{' CONTENU '}'
				|ETIQUETTE '['BLOCATTRIBUT']' '{'CONTENU '}'



ETIQUETTE	->	

ETIQUETTE[ATTRIBUT]{"CONTENU"}	->	<ETIQUETTE ATTRIBUT>CONTENU</ETIQUETTE>
ETIQUETTE{"CONTENU"}			->	<ETIQUETTE>CONTENU</ETIQUETTE>
ETIQUETTE/						->	<ETIQUETTE/>
*/
#include <stdio.h>
#include <math.h>
#include "../header/tree.h"

int yylex(void);
void yyerror(char*);

%}

%token SPACE
%token TEXT
%token TAG
%token WORD
%token LINK
%token EOL

%%

f	: 	'{' f '}'
	| 	f t
	| 	t
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