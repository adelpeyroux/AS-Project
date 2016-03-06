#include "../header/tree.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


attributes create_attributes(char* key, char* value){
	attributes attrs = malloc(sizeof(struct s_attributes));
	
	attrs->key = key;
	attrs->value = value;
	attrs->next = NULL;
	
	return attrs;
}

void destroy_attributes(attributes attrs){
	attributes next = (attrs == NULL ? NULL : attrs->next);
	if (next != NULL){
		destroy_attributes(next);
	}
	if (attrs != NULL){
		free(attrs);		
	}
}

void add_attributes(attributes attrs, char* key, char* value){
	attributes new_attr = create_attributes(key, value);
	
	new_attr->next = attrs;
	attrs = new_attr;
}

tree create_tree(char* label, bool nullary, bool space, enum type tp){
	tree t = malloc(sizeof(struct s_tree));
	
	t->label = label;
	t->space = space;
	if (tp == t_word){
		t->nullary = true;
	} else {
		t->nullary = nullary;
	}
	t->tp = tp;
	
	t->attr = NULL;
	t->daughters = NULL;
	
	return t;
}

void destroy_tree(tree t){
	if (t->attr){
		destroy_attributes(t->attr);
	}
	if (t->daughters != NULL){
		destroy_tree(t->daughters);
	}
	if (t->right != NULL){
		destroy_tree(t->right);
	}
	free(t);
}