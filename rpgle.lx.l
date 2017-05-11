%{

#include "rpgle.h"
#include "rpgle.g.h"

%}

white	[ \t\n]
ident	[a-zA-Z_][a-zA-Z0-9_]*

%%

"dcl-proc"	{ return DCLPROC; }
"export"	{ return EXPORT; }
"end-proc"	{ return ENDPROC; }

"dcl-pi"	{ return DCLPI; }
"*n"	{ return STAR_N; }
"end-pi"	{ return ENDPI; }

{ident}	{ yylval.str = strdup(yytext); return IDENT; }
{white}	/* Ignore */
.	{ return yytext[0]; }
%%
