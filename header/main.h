#ifndef _MAIN_H_
#define _MAIN_H_

#include "../header/variables.h"

int yylex(void);
void yyerror(char*);
int last_ret;

variables_list* vl;

#endif