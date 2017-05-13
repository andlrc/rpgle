%{

#include "rpgle.h"
#include "rpgle.g.h"

%}

ident		[a-zA-Z_][a-zA-Z0-9_]*
indicator	"*"{ident}
white		[ \t\n]
int		-?[0-9]+

%%

"dcl-proc"	{ return DCLPROC; }
"export"	{ return EXPORT; }
"end-proc"	{ return ENDPROC; }

"dcl-pi"	{ return DCLPI; }
"end-pi"	{ return ENDPI; }

"char"		|
"varchar"	|
"ucs"		|
"varucs"	|
"graph"		|
"ind"		|
"packed"	|
"zoned"		|
"bindec"	|
"int"		|
"uns"		|
"float"		|
"date"		|
"time"		|
"timestamp"	|
"pointer"	|
"object"	{ yylval.str = strdup(yytext); return IDENTTYPE; }

{indicator}	{ yylval.str = strdup(yytext); return INDICATOR; }
{ident}		{ yylval.str = strdup(yytext); return IDENT; }
{int}		{ yylval.inum = atoi(yytext); return INUM; }
{white}		/* Ignore */
.		{ return yytext[0]; }
%%
