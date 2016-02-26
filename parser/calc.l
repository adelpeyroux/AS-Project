%{
#include "../generated/calc.tab.h"
#include <stdlib.h>
%}

%option noinput nounput

%%

\+							{ return '+'; }
\-							{ return '-'; }
\/							{ return '/'; }
\%							{ return '%'; }
\*							{ return '*'; }
\*\*						{ return PUI; }
\(							{ return '('; }
\)							{ return ')'; }
;							{ return ';'; }
=							{ return '='; }
\?							{ return '?'; }
\:							{ return ':'; }
[[:digit:]]+				{ yylval.value= atoi(yytext); return NUM; }
[[:alpha:]_][[:alnum:]_]* 	{ yylval.name = strdup(yytext); return IDENTIFIER; }
.|\n			;
	