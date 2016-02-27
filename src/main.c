#include <stdio.h>
#include <math.h>
#include "../header/main.h"
#include "../generated/parser.tab.h"

void yyerror (char *s) {
	fprintf (stderr, "%s\n", s);
}

int main(){
	return 0;
}