%{
#include "exptree.h"
#include <stdio.h>
#include <stdlib.h>
struct treeNode	*root;
struct treeNode	*p;
%}
%union
{
	int				ival;
	struct treeNode	*tval;
}
%token	<ival>	TNUMBER
%type	<tval>	Exp Term Num
%%
s		:	Exp			{root=$1;}
Exp		:	Exp'+'Term	{$1->bro = $3; $$=buildTree(PLUS, 0, NULL, $1);}
		|	Term		{$$=$1;}
		;
Term	:	Term'*'Num	{$1->bro=$3; $$=buildTree(TIMES, 0, NULL, $1);}
		|	Num			{$$=$1;}
		;
Num		:	TNUMBER		{$$=buildTree(NUMBER, $1, NULL, NULL);printf("num: %d\n", $1);}
		|	'('Exp')'	{$$=$2;}
		;
%%
main()
{
	yyparse();
	printAST(root);
}
yyerror(s)
char	*s;
{
	fprintf(stderr, "Error: %s\n", s);
}
