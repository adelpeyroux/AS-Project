%{
#include "../generated/parser.tab.h"
#include <stdlib.h>
%}

%option noinput nounput
%x S_TEXT

TAG _[[:alnum:]]+[[:alnum:]_\.']*|[[:alnum:]][[:alnum:]_\.']*


%%

\[							{ return '['; }
\]							{ return ']'; }
\{							{ return '{'; }
\}							{ return '}'; }
\/							{ return '/'; }
,							{ return ','; }
=							{ return '='; }
[[:blank:]]					{ return SPACE; }
\"							{ BEGIN S_TEXT; }
<S_TEXT>\"					{ BEGIN INITIAL; }
<S_TEXT>[^[:blank:]]		{ return TEXT; }
<S_TEXT>.*|\n				{}
.|\n			;
	