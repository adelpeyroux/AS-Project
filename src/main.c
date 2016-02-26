#include <stdio.h>
#include <math.h>
#include "../header/main.h"
#include "../generated/calc.tab.h"

void yyerror (char *s) {
	fprintf (stderr, "%s\n", s);
}

int main(){
	vl = create_variables_list();
	while ((last_ret = yyparse()) != -1){
		if (last_ret == 10)
			printf("Retourne a la maternelle FDP ! On divise pas par zéro !!!\n");
		else if (last_ret == 11) 
			printf("Retourne a la maternelle FDP ! Et aprends a instancier des variables ...\n");
	}
	
	return 0;
}