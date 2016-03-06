%{
/*	GRAMMAIRE
CONTENU							->	CONTENU MOT
CONTENU							->	CONTENU LIAISON
CONTENU							->	LIAISON
CONTENU							->	MOT

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