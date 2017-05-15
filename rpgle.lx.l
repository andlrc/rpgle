%{

#include "rpgle.h"
#include "y.tab.h"


extern void yyerror(const char *);
static void count();

%}

%option caseless

ws	[\t\r\n ]+

%%

	/* H-Spec */
"dcl-opt"	{ count(); return DCL_OPT; }

"debug"		{ count(); return DEBUG; }
"datedit"	{ count(); return DATEDIT; }
"option"	{ count(); return OPTION; }
"datfmt"	{ count(); return DATFMT; }
"timfmt"	{ count(); return TIMFMT; }
"actgrp"	{ count(); return ACTGRP; }
"aut"		{ count(); return AUT; }
"bnddir"	{ count(); return BNDDIR; }

"*yes"		{ count(); return _YES; }
"*mdy"		{ count(); return _MDY; }
"*dmy"		{ count(); return _DMY; }
"*ymd"		{ count(); return _YMD; }
"*iso"		{ count(); return _ISO; }
"*usa"		{ count(); return _USA; }
"*eur"		{ count(); return _EUR; }
"*noxref"	{ count(); return _NOXREF; }
"*xref"		{ count(); return _XREF; }
"*nogen"	{ count(); return _NOGEN; }
"*gen"		{ count(); return _GEN; }
"*noseclvl"	{ count(); return _NOSECLVL; }
"*seclvl"	{ count(); return _SECLVL; }
"*noshowcpy"	{ count(); return _NOSHOWCPY; }
"*showcpy"	{ count(); return _SHOWCPY; }
"*noexpdds"	{ count(); return _NOEXPDDS; }
"*expdds"	{ count(); return _EXPDDS; }
"*nosrcstmt"	{ count(); return _NOSRCSTMT; }
"*srcstmt"	{ count(); return _SRCSTMT; }
"*nodebugio"	{ count(); return _NODEBUGIO; }
"*debugio"	{ count(); return _DEBUGIO; }

	/* F-Spec */
"dcl-f"		{ count(); return DCL_F; }

"usage"		{ count(); return USAGE; }
"disk"		{ count(); return DISK; }
"printer"	{ count(); return PRINTER; }
"seq"		{ count(); return SEQ; }
"special"	{ count(); return SPECIAL; }
"workstn"	{ count(); return WORKSTN; }
"keyed"		{ count(); return KEYED; }
"extdesc"	{ count(); return EXTDESC; }

"*ext"		{ count(); return _EXT; }
"*input"	{ count(); return _INPUT; }
"*output"	{ count(); return _OUTPUT; }

	/* D-Spec */
"dcl-s"		{ count(); return DCL_S; }
"dcl-c"		{ count(); return DCL_C; }
"dcl-pi"	{ count(); return DCL_PI; }
"end-pi"	{ count(); return END_PI; }
"dcl-pr"	{ count(); return DCL_PR; }
"end-pr"	{ count(); return END_PROC; }

"extproc"	{ count(); return EXTPROC; }
"inz"		{ count(); return INZ; }
"const"		{ count(); return CONST; }
"like"		{ count(); return LIKE; }
"likeds"	{ count(); return LIKEDS; }
"likerec"	{ count(); return LIKEREC; }
"pos"		{ count(); return POS; }

"char"		{ count(); return CHAR; }
"varchar"	{ count(); return VARCHAR; }
"ucs"		{ count(); return UCS; }
"varucs"	{ count(); return VARUCS; }
"graph"		{ count(); return GRAPH; }
"ind"		{ count(); return IND; }
"packed"	{ count(); return PACKED; }
"zoned"		{ count(); return ZONED; }
"bindec"	{ count(); return BINDEC; }
"int"		{ count(); return INT; }
"uns"		{ count(); return UNS; }
"float"		{ count(); return FLOAT; }
"date"		{ count(); return DATE; }
"time"		{ count(); return TIME; }
"timestamp"	{ count(); return TIMESTAMP; }
"pointer"	{ count(); return POINTER; }
"object"	{ count(); return OBJECT; }

"dim"		{ count(); return DIM; }
"value"		{ count(); return VALUE; }
"options"	{ count(); return OPTIONS; }
"dcl-parm"	{ count(); return DCL_PARM; }

"*n"		{ count(); return _N; }

	/* I-Spec */

	/* C-Spec */
"if"		{ count(); return IF; }

"elseif"	{ count(); return ELSEIF; }
"else"		{ count(); return ELSE; }
"endif"		{ count(); return ENDIF; }

"dow"		{ count(); return DOW; }
"dou"		{ count(); return DOU; }
"enddo"		{ count(); return ENDDO; }

"for"		{ count(); return FOR; }
"by"		{ count(); return BY; }
"to"		{ count(); return TO; }
"downto"	{ count(); return DOWNTO; }
"endfor"	{ count(); return ENDFOR; }

"and"		{ count(); return AND_OP; }
"or"		{ count(); return OR_OP; }
"<="		{ count(); return LE_OP; }
">="		{ count(); return GE_OP; }
"<>"		{ count(); return NE_OP; }
"<"		{ count(); return '<'; }
">"		{ count(); return '>'; }
"="		{ count(); return '='; }

"+="		{ count(); return ADD_ASSIGN; }
"-="		{ count(); return SUB_ASSIGN; }
"*="		{ count(); return MUL_ASSIGN; }
"/="		{ count(); return DIV_ASSIGN; }

	/* O-Spec */

	/* P-Spec */
"dcl-proc"	{ count(); return DCL_PROC; }
"end-proc"	{ count(); return END_PROC; }

"export"	{ count(); return EXPORT; }

"white"		{ count(); }

"("		{ count(); return '('; }
")"		{ count(); return ')'; }
";"		{ count(); return ';'; }

%%

int column = 0,
    line = 0;
static void count()
{
#ifdef RPGLE_DEBUG
	printf(">>%s<<\n", yytext);
#endif
	do {
		if (*yytext == '\n') {
			column = 0;
			line++;
		}
		else if (*yytext == '\t') {
			column += 8 - (column % 8);
		}
		else {
			column++;
		}
	} while (*yytext++ != '\0');
}
