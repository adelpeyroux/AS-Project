#include "../header/variables.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


variable create_variable (char* name, int value){
	variable new_var = malloc(sizeof(struct variable_t));
	new_var->name = name;	
	new_var->value = value;
	new_var->next = NULL;
	
	return new_var;	
}

void destroy_variable (variable var){
	free(var);
}

variables_list* create_variables_list(){
	variables_list* new_vl = malloc(sizeof(struct variables_list_t));
	new_vl->first = NULL;
	new_vl->last = NULL;
	new_vl->nb = 0;
	return new_vl;	
}

void clear_variables_list(variables_list* vl){
	if (vl->first != NULL){
		variable tmp = vl->first;
		vl->first = tmp->next;
		free(tmp);
		clear_variables_list(vl);
	}
}

void variables_list_insert (variables_list* vl, variable object){
	variable found;
	if ((found = variables_list_find(vl, object->name)) != NULL ){
		found->value = object->value;
	} else {
		if (vl->first == NULL && vl->last == NULL){
			vl->first = object;
			vl->last = object;
		} else {
			vl->last->next = object;
			vl->last = object;
		}
		vl->nb++;
	}
}

variable variables_list_find (variables_list* vl, char* name){
	variable it;
	for (it = vl->first; it != NULL; it = it->next)
		if (!strcmp(it->name, name))
			break;
			
	return it;
}

void print_list(variables_list* vl){
	variable it = vl->first;
	for (it = vl->first; it != NULL; it = it->next)
		printf("%s\n", it->name);
}
