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
	attributes temp = attrs;
	attributes next = (temp == NULL ? NULL : temp->next);
	while(next != NULL){
		destroy_attributes(temp);
		attributes temp = next;
		attributes next = (temp == NULL ? NULL : temp->next);
	}
}

void add_attributes(attributes attrs, char* key, char* value){
	attributes new_attr = create_attributes(key, value);
	
	new_attr->next = attrs;
	attrs = new_attr;
}

tree create_tree(char* label, bool nullary, bool space, enum type tp, attributes attrs, tree children, tree right){

}

void destroy_tree(tree t){

}