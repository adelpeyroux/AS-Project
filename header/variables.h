#ifndef _VARIABLES_H_
#define _VARIABLES_H_

struct variable_t;

typedef struct variable_t* variable;

typedef struct variables_list_t {
	int nb;
	variable first;
	variable last;
} variables_list;

struct variable_t{
	char* name; 
	int value;
	variable next;
};


variable create_variable (char* name, int value);
void destroy_variable (variable var);

variables_list* create_variables_list();
void clear_variables_list(variables_list* vl);

void variables_list_insert (variables_list* vl, variable object);
variable variables_list_find (variables_list* vl, char* name);

void print_list(variables_list* vl);

#endif