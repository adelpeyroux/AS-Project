%{
#include "../generated/parser.tab.h"
#include <stdlib.h>
%}

%option noinput nounput
%x S_TEXT

%%

\"							{ BEGIN S_TEXT; }
<S_TEXT>\"					{ BEGIN INITIAL; }
<S_TEXT>[[:alnum:]]*		{ yylval = strdup(yytext);	return MOT; }
<S_TEXT>\\\"				{ yylval = strdup(yytext);	return LIAISON; }
<S_TEXT>.					{ yylval = strdup(yytext);	return LIAISON; }

[[:alpha:]_][[:alnum:]_]*	{ yylval = strdup(yytext);	return ETIQUETTE;}
[[:blank:]]+				{ return SPACE; }

"["|"]"|"{"|"}"|"/"|","|"="	{ yylval = strdup(yytext);	return OPERATEUR;}

\n+							{ return EOL; }
.							{return yytext[0];}
%%
//S_TEXT	: Etat exclusifs permettant de définir un texte litéral, on perd les guillemets.
//				Il faudra les remettre dans le cas ou il serait précédé d'un =.
//MOT		: un mot (au sens large) en caractère alphanumérique
//LIAISON	: des espaces ou un signe de poncutation les mots chelou genre 23-34àaio compteront comme 3 mots mais ce n'est pas important
//ETIQUETTE	: Debut d'une balise html ou d'un argument suivant ou on se situe (entre crochet ou non)
//SPACE		: il ne gardera qu'un espace si on en a plusieurs
//OPERATEUR	: différents opérateurs necessaire à définir les balisage.
//Les deux derniers servent de bazar si On a oublié quleque chose
