%{
#include <stdio.h>
#include "test1.tab.h"
extern YYSTYPE yylval;
%}
%%
[0-9]+		{yylval.ival = (int) strtol(yytext, NULL, 0); return(TNUMBER);}
[\t]		;
\n			return(0);
\+			return('+');
\*			return('*');
\(			return('(');
\)			return(')');
.			{printf("'%c': illegal character\n", yytext[0]);exit(-1);}
