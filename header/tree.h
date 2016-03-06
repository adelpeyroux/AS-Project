#ifndef _TREE_H_
#define _TREE_H_

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

struct s_tree;
struct s_attributes;
enum type {t_tree, t_word};		//typage des nœuds: permet de savoir si un nœud construit
								//un arbre ou s'il s'agit simplement de texte
							   
struct s_attributes{
    char * key;					//nom de l'attribut
    char * value;				//valeur de l'attribut
    struct s_attributes * next;	//attribut suivant
};

struct s_tree {
    char * label;				//étiquette du nœud
    bool nullary;				//nœud vide, par exemple <br/>
    bool space;					//nœud suivi d'un espace
    enum type tp;				//type du nœud. nullary doit être tr	ue s tp vaut word
    struct s_attributes * attr;	//attributs du nœud
    struct s_tree * daughters;	//fils gauche, qui doit être NULL si nullary est true
    struct s_tree * right;		//frère droit
};

typedef struct s_tree * tree;
typedef struct s_attributes * attributes;

/*
 * Attributes Part
 * Public functions
 */
attributes create_attributes(char* key, char* value);
void destroy_attributes(attributes attrs);

void add_attributes(attributes attrs, char* key, char* value);

/*
 * Tree Part
 * Public functions
 */
tree create_tree(char* label, bool nullary, bool space, enum type tp, attributes attrs, tree children, tree right); // YOUHOU ! L'ECOLOGIE C'EST TROP BIEN ET LES ARBRES AUSSI ! 
void destroy_tree(tree t); // BEURK ! MORT A LA DEFORESTATION !

#endif