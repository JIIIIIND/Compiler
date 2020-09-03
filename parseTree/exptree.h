typedef enum { PLUS, TIMES, NUMBER }	nodetype;
typedef struct treeNode	tnode;

struct	treeNode {
	nodetype	type;
	int			value;
	tnode		*bro;
	tnode		*son
};
tnode	*buildTree();
tnode	*endBro();
