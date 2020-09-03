#include <stdio.h>
#include <stdlib.h>
#include "exptree.h"

printAST(n) 
tnode *n;
{
	printASTi(n,0);
}

printASTi(n, i)
tnode *n;
int i;
{
	int c;
	while (n != NULL) {
		for (c=i; c>0; c--)
			printf(" ");
		printNode(n);
		printf("\n");
		printASTi (n->son, i+2);
		n = n->bro;
	}  /* end of while(n) */
}

printNode(n)
tnode *n;
{
	switch (n->type) {
	case PLUS:
		printf("PLUS");
		break;
	case TIMES:
		printf("TIMES");
		break;
	case NUMBER:
		printf("NUMBER: %d", n->value);
		break;
	otherwise:
		printf("Unknown node %d", n->type);
		break;
	}  /* end of switch(type) */
}

tnode *
endBro(n)
tnode *n;
{
	if (n == NULL) {
		fprintf(stderr, "error in endBro()\n");
		return;
	}
	while (n->bro != NULL)
		n = n->bro;
	return(n);
}

tnode *
buildTree(t, v, b, s)
nodetype t;
int v;
tnode *b, *s;
{
	tnode *n;
	n = (tnode *) malloc(sizeof(tnode));
	n->type = t;
	n->value = v;
	n->bro = b;
	n->son = s;
	return(n);
}
