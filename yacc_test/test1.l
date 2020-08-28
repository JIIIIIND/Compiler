%{
#include "yacc_test1.tab.h"
%}
%%
[0-9]+		{printf("number detected\n");return(NUMBER);}
[\t]		;
\n			return(0);
\+			return('+');
\+\+		{printf("++ detected\n");return("++");}
\*			return('*');
.			{printf("'%c': illegal character\n", yytext[0]);exit(-1);}
