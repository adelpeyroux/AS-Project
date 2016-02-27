%{
#include "../generated/parser.tab.h"
#include <stdlib.h>
%}

%option noinput nounput
%x TEXT

TAG [[:alpha:]_][[:alnum:]_\.']+ 

%%

\[							{ return '['; }
\]							{ return ']'; }
\{							{ return '{'; }
\}							{ return '}'; }
\/							{ return '/'; }
,							{ return ','; }
=							{ return '='; }
[[:blank:]]					{ return SPACE; }
\"							{ BEGIN TEXT; }
<TEXT>\"					{ BEGIN INITIAL; }
.|\n			;
	