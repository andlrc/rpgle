%{

#include "rpgle.h"
#include "rpgle.g.h"

%}

ident		[a-zA-Z_][a-zA-Z0-9_]*
indicator	"*"{ident}
white		[ \t\n]+
inum		-?[0-9]+
dnum		-?[0-9]+("."[0-9]+)?
str		"'"("''"|[^'])*"'"

%%

"dcl-proc"	{ PUTS("DCLPROC", ""); return DCLPROC; }
"export"	{ PUTS("EXPORT", ""); return EXPORT; }
"end-proc"	{ PUTS("ENDPROC", ""); return ENDPROC; }

"dcl-c"		{ PUTS("DLCC", "") return DCLC; }

"dcl-pi"	{ PUTS("DCLPI", ""); return DCLPI; }
"end-pi"	{ PUTS("ENDPI", ""); return ENDPI; }

"const"		{ PUTS("CONST", ""); return CONST; }

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
"object"	{ PUTS("IDENTTYPE", yytext); yylval.str = strdup(yytext); return IDENTTYPE; }

{indicator}	{ PUTS("INDICATOR", ""); yylval.str = strdup(yytext); return INDICATOR; }
{ident}		{ PUTS("ident", yytext); yylval.str = strdup(yytext); return IDENT; }
{inum}		{ PUTS("INUM", yytext); yylval.inum = atoi(yytext); return INUM; }
{dnum}		{ PUTS("DNUM", yytext); yylval.dnum = atof(yytext); return DNUM; }
{str}		{ PUTS("STR", yytext); yylval.str = strdup(yytext); return STR; }
{white}		{ PUTS("WHITE", ""); }
.		{ PUTS("OTHER", yytext); return yytext[0]; }
%%
