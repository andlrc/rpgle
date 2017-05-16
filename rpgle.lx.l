%{

#include "rpgle.h"
#include "y.tab.h"


static void count();

%}

%option caseless

ident		[a-zA-Z_][a-zA-Z0-9_]*
varchar		'(''|[^'])*'
int		(0|[1-9][0-9]*)
ws		[\t\r\n ]+

%%

	/* H-Spec */
"DCL-OPT"		{ count(); return DCL_OPT; }
"ALLOC"			{ count(); return ALLOC; }
"ACTGRP"		{ count(); return ACTGRP; }
"ALTSEQ"		{ count(); return ALTSEQ; }
"ALWNULL"		{ count(); return ALWNULL; }
"AUT"			{ count(); return AUT; }
"BNDDIR"		{ count(); return BNDDIR; }
"CCSID"			{ count(); return CCSID; }
"CCSIDCVT"		{ count(); return CCSIDCVT; }
"COPYNEXT"		{ count(); return COPYNEXT; }
"COPYRIGHT"		{ count(); return COPYRIGHT; }
"CURSYM"		{ count(); return CURSYM; }
"CVTOPT"		{ count(); return CVTOPT; }
"DATEDIT"		{ count(); return DATEDIT; }
"DATFMT"		{ count(); return DATFMT; }
"DEBUG"			{ count(); return DEBUG; }
"DECEDIT"		{ count(); return DECEDIT; }
"DECPREC"		{ count(); return DECPREC; }
"DFTACTGRP"		{ count(); return DFTACTGRP; }
"DFTNAME"		{ count(); return DFTNAME; }
"ENBPFRCOL"		{ count(); return ENBPFRCOL; }
"EXPROPTS"		{ count(); return EXPROPTS; }
"EXTBININT"		{ count(); return EXTBININT; }
"FIXNBR"		{ count(); return FIXNBR; }
"FLTDIV"		{ count(); return FLTDIV; }
"FORMSALIGN"		{ count(); return FORMSALIGN; }
"FTRANS"		{ count(); return FTRANS; }
"GENLVL"		{ count(); return GENLVL; }
"INDENT"		{ count(); return INDENT; }
"INTPREC"		{ count(); return INTPREC; }
"LANGID"		{ count(); return LANGID; }
"MAIN"			{ count(); return MAIN; }
"NOMAIN"		{ count(); return NOMAIN; }
"OPENOPT"		{ count(); return OPENOPT; }
"OPTIMIZE"		{ count(); return OPTIMIZE; }
"OPTION"		{ count(); return OPTION; }
"PGMINFO"		{ count(); return PGMINFO; }
"PRFDTA"		{ count(); return PRFDTA; }
"SRTSEQ"		{ count(); return SRTSEQ; }
"STGMDL"		{ count(); return STGMDL; }
"TEXT"			{ count(); return TEXT; }
"THREAD"		{ count(); return THREAD; }
"TIMFMT"		{ count(); return TIMFMT; }
"TRUNCNBR"		{ count(); return TRUNCNBR; }
"USRPRF"		{ count(); return USRPRF; }
"VALIDATE"		{ count(); return VALIDATE; }

"*ALL"			{ count(); return _ALL; }
"*BASIC"		{ count(); return _BASIC; }
"*BLANK"		{ count(); return _BLANK; }
"*CALLER"		{ count(); return _CALLER; }
"*CHANGE"		{ count(); return _CHANGE; }
"*CHAR"			{ count(); return _CHAR; }
"*COL"			{ count(); return _COL; }
"*CONCURRENT"		{ count(); return _CONCURRENT; }
"*DATETIME"		{ count(); return _DATETIME; }
"*DEBUGIO"		{ count(); return _DEBUGIO; }
"*DMY"			{ count(); return _DMY; }
"*DUMP"			{ count(); return _DUMP; }
"*ENTRYEXIT"		{ count(); return _ENTRYEXIT; }
"*EUR"			{ count(); return _EUR; }
"*EXCLUDE"		{ count(); return _EXCLUDE; }
"*EXCP"			{ count(); return _EXCP; }
"*EXPDDS"		{ count(); return _EXPDDS; }
"*EXT"			{ count(); return _EXT; }
"*FULL"			{ count(); return _FULL; }
"*GEN"			{ count(); return _NOGEN; }
"*GRAPH"		{ count(); return _GRAPH; }
"*GRAPHIC"		{ count(); return _GRAPHIC; }
"*HEX"			{ count(); return _HEX; }
"*HMS"			{ count(); return _HMS; }
"*IGNORE"		{ count(); return _IGNORE; }
"*INHERIT"		{ count(); return _INHERIT; }
"*INPUT"		{ count(); return _INPUT; }
"*INPUTONLY"		{ count(); return _INPUTONLY; }
"*INPUTPACKED"		{ count(); return _INPUTPACKED; }
"*INZOFL"		{ count(); return _INZOFL; }
"*ISO"			{ count(); return _ISO; }
"*JIS"			{ count(); return _JIS; }
"*JOB"			{ count(); return _JOB; }
"*JOBRUN"		{ count(); return _JOBRUN; }
"*LANGIDSHR"		{ count(); return _LANGIDSHR; }
"*LANGIDUNQ"		{ count(); return _LANGIDUNQ; }
"*LIBRCRTAUT"		{ count(); return _LIBRCRTAUT; }
"*LIST"			{ count(); return _LIST; }
"*MAXDIGITS"		{ count(); return _MAXDIGITS; }
"*MDY"			{ count(); return _MDY; }
"*MODULE"		{ count(); return _MODULE; }
"*NEW"			{ count(); return _NEW; }
"*NO"			{ count(); return _NO; }
"*NOCOL"		{ count(); return _NOCOL; }
"*NODATETIME"		{ count(); return _NODATETIME; }
"*NODEBUGIO"		{ count(); return _NODEBUGIO; }
"*NOEXPDDS"		{ count(); return _NOEXPDDS; }
"*NOEXT"		{ count(); return _NOEXT; }
"*NOGEN"		{ count(); return _NOGEN; }
"*NOGRAPHIC"		{ count(); return _NOGRAPHIC; }
"*NOINPUTPACKED"	{ count(); return _NOINPUTPACKED; }
"*NOINZOFL"		{ count(); return _NOINZOFL; }
"*NONE"			{ count(); return _NONE; }
"*NOSECLVL"		{ count(); return _NOSECLVL; }
"*NOSHOWCPY"		{ count(); return _NOSHOWCPY; }
"*NOSHOWSKP"		{ count(); return _NOSHOWSKP; }
"*NOSRCSTMT"		{ count(); return _NOSRCSTMT; }
"*NOUNREF"		{ count(); return _NOUNREF; }
"*NOVARCHAR"		{ count(); return _NOVARCHAR; }
"*NOVARGRAPHIC"		{ count(); return _NOVARGRAPHIC; }
"*NOXREF"		{ count(); return _NOXREF; }
"*NOZONED"		{ count(); return _NOZONED; }
"*OWNER"		{ count(); return _OWNER; }
"*PCML"			{ count(); return _PCML; }
"*PEP"			{ count(); return _PEP; }
"*RESDECPOS"		{ count(); return _RESDECPOS; }
"*SECLVL"		{ count(); return _SECLVL; }
"*SERIALIZE"		{ count(); return _SERIALIZE; }
"*SHOWCPY"		{ count(); return _SHOWCPY; }
"*SHOWSKP"		{ count(); return _SHOWSKP; }
"*SNGLVL"		{ count(); return _SNGLVL; }
"*SRC"			{ count(); return _SRC; }
"*SRCMBRTXT"		{ count(); return _SRCMBRTXT; }
"*SRCSTMT"		{ count(); return _SRCSTMT; }
"*STGMDL"		{ count(); return _STGMDL; }
"*TERASPACE"		{ count(); return _TERASPACE; }
"*UCS2"			{ count(); return _UCS2; }
"*UNDEF"		{ count(); return _UNDEF; }
"*USA"			{ count(); return _USA; }
"*USE"			{ count(); return _USE; }
"*USER"			{ count(); return _USER; }
"*USRCTL"		{ count(); return _USRCTL; }
"*VARCHAR"		{ count(); return _VARCHAR; }
"*VARGRAPHIC"		{ count(); return _VARGRAPHIC; }
"*XMLSAX"		{ count(); return _XMLSAX; }
"*XREF"			{ count(); return _XREF; }
"*YES"			{ count(); return _YES; }
"*YMD"			{ count(); return _YMD; }
"*ZONED"		{ count(); return _ZONED; }

	/* F-Spec */
"DCL-F"			{ count(); return DCL_F; }
"ALIAS"			{ count(); return ALIAS; }
"BLOCK"			{ count(); return BLOCK; }
"COMMIT"		{ count(); return COMMIT; }
"DEVID"			{ count(); return DEVID; }
"DISK"			{ count(); return DISK; }
"EXTDESC"		{ count(); return EXTDESC; }
"EXTFILE"		{ count(); return EXTFILE; }
"EXTIND"		{ count(); return EXTIND; }
"EXTMBR"		{ count(); return EXTMBR; }
"FORMLEN"		{ count(); return FORMLEN; }
"FORMOFL"		{ count(); return FORMOFL; }
"HANDLER"		{ count(); return HANDLER; }
"IGNORE"		{ count(); return IGNORE; }
"INCLUDE"		{ count(); return INCLUDE; }
"INDDS"			{ count(); return INDDS; }
"INFDS"			{ count(); return INFDS; }
"INFSR"			{ count(); return INFSR; }
"KEYED"			{ count(); return KEYED; }
"KEYLOC"		{ count(); return KEYLOC; }
"LIKEFILE"		{ count(); return LIKEFILE; }
"MAXDEV"		{ count(); return MAXDEV; }
"OFLIND"		{ count(); return OFLIND; }
"PASS"			{ count(); return PASS; }
"PGMNAME"		{ count(); return PGMNAME; }
"PLIST"			{ count(); return PLIST; }
"PREFIX"		{ count(); return PREFIX; }
"PRINTER"		{ count(); return PRINTER; }
"PRTCTL"		{ count(); return PRTCTL; }
"QUALIFIED"		{ count(); return QUALIFIED; }
"RAFDATA"		{ count(); return RAFDATA; }
"RECNO"			{ count(); return RECNO; }
"RENAME"		{ count(); return RENAME; }
"SAVEDS"		{ count(); return SAVEDS; }
"SEQ"			{ count(); return SEQ; }
"SFILE"			{ count(); return SFILE; }
"SLN"			{ count(); return SLN; }
"SPECIAL"		{ count(); return SPECIAL; }
"STATIC"		{ count(); return STATIC; }
"TEMPLATE"		{ count(); return TEMPLATE; }
"USAGE"			{ count(); return USAGE; }
"USROPN"		{ count(); return USROPN; }
"WORKSTN"		{ count(); return WORKSTN; }

"*COMPAT"		{ count(); return _COMPAT; }
"*DELETE"		{ count(); return _DELETE; }
"*EXTDESC"		{ count(); return _EXTDESC; }
"*FILE"			{ count(); return _FILE; }
"*IN01"			{ count(); return _IN01; }
"*IN02"			{ count(); return _IN02; }
"*IN03"			{ count(); return _IN03; }
"*IN04"			{ count(); return _IN04; }
"*IN05"			{ count(); return _IN05; }
"*IN06"			{ count(); return _IN06; }
"*IN07"			{ count(); return _IN07; }
"*IN08"			{ count(); return _IN08; }
"*IN09"			{ count(); return _IN09; }
"*IN10"			{ count(); return _IN10; }
"*IN11"			{ count(); return _IN11; }
"*IN12"			{ count(); return _IN12; }
"*IN13"			{ count(); return _IN13; }
"*IN14"			{ count(); return _IN14; }
"*IN15"			{ count(); return _IN15; }
"*IN16"			{ count(); return _IN16; }
"*IN17"			{ count(); return _IN17; }
"*IN18"			{ count(); return _IN18; }
"*IN19"			{ count(); return _IN19; }
"*IN20"			{ count(); return _IN20; }
"*IN21"			{ count(); return _IN21; }
"*IN22"			{ count(); return _IN22; }
"*IN23"			{ count(); return _IN23; }
"*IN24"			{ count(); return _IN24; }
"*IN25"			{ count(); return _IN25; }
"*IN26"			{ count(); return _IN26; }
"*IN27"			{ count(); return _IN27; }
"*IN28"			{ count(); return _IN28; }
"*IN29"			{ count(); return _IN29; }
"*IN30"			{ count(); return _IN30; }
"*IN31"			{ count(); return _IN31; }
"*IN32"			{ count(); return _IN32; }
"*IN33"			{ count(); return _IN33; }
"*IN34"			{ count(); return _IN34; }
"*IN35"			{ count(); return _IN35; }
"*IN36"			{ count(); return _IN36; }
"*IN37"			{ count(); return _IN37; }
"*IN38"			{ count(); return _IN38; }
"*IN39"			{ count(); return _IN39; }
"*IN40"			{ count(); return _IN40; }
"*IN41"			{ count(); return _IN41; }
"*IN42"			{ count(); return _IN42; }
"*IN43"			{ count(); return _IN43; }
"*IN44"			{ count(); return _IN44; }
"*IN45"			{ count(); return _IN45; }
"*IN46"			{ count(); return _IN46; }
"*IN47"			{ count(); return _IN47; }
"*IN48"			{ count(); return _IN48; }
"*IN49"			{ count(); return _IN49; }
"*IN50"			{ count(); return _IN50; }
"*IN51"			{ count(); return _IN51; }
"*IN52"			{ count(); return _IN52; }
"*IN53"			{ count(); return _IN53; }
"*IN54"			{ count(); return _IN54; }
"*IN55"			{ count(); return _IN55; }
"*IN56"			{ count(); return _IN56; }
"*IN57"			{ count(); return _IN57; }
"*IN58"			{ count(); return _IN58; }
"*IN59"			{ count(); return _IN59; }
"*IN60"			{ count(); return _IN60; }
"*IN61"			{ count(); return _IN61; }
"*IN62"			{ count(); return _IN62; }
"*IN63"			{ count(); return _IN63; }
"*IN64"			{ count(); return _IN64; }
"*IN65"			{ count(); return _IN65; }
"*IN66"			{ count(); return _IN66; }
"*IN67"			{ count(); return _IN67; }
"*IN68"			{ count(); return _IN68; }
"*IN69"			{ count(); return _IN69; }
"*IN70"			{ count(); return _IN70; }
"*IN71"			{ count(); return _IN71; }
"*IN72"			{ count(); return _IN72; }
"*IN73"			{ count(); return _IN73; }
"*IN74"			{ count(); return _IN74; }
"*IN75"			{ count(); return _IN75; }
"*IN76"			{ count(); return _IN76; }
"*IN77"			{ count(); return _IN77; }
"*IN78"			{ count(); return _IN78; }
"*IN79"			{ count(); return _IN79; }
"*IN80"			{ count(); return _IN80; }
"*IN81"			{ count(); return _IN81; }
"*IN82"			{ count(); return _IN82; }
"*IN83"			{ count(); return _IN83; }
"*IN84"			{ count(); return _IN84; }
"*IN85"			{ count(); return _IN85; }
"*IN86"			{ count(); return _IN86; }
"*IN87"			{ count(); return _IN87; }
"*IN88"			{ count(); return _IN88; }
"*IN89"			{ count(); return _IN89; }
"*IN90"			{ count(); return _IN90; }
"*IN91"			{ count(); return _IN91; }
"*IN92"			{ count(); return _IN92; }
"*IN93"			{ count(); return _IN93; }
"*IN94"			{ count(); return _IN94; }
"*IN95"			{ count(); return _IN95; }
"*IN96"			{ count(); return _IN96; }
"*IN97"			{ count(); return _IN97; }
"*IN98"			{ count(); return _IN98; }
"*IN99"			{ count(); return _IN99; }
"*INOA"			{ count(); return _INOA; }
"*INOB"			{ count(); return _INOB; }
"*INOC"			{ count(); return _INOC; }
"*INOD"			{ count(); return _INOD; }
"*INOE"			{ count(); return _INOE; }
"*INOF"			{ count(); return _INOF; }
"*INOG"			{ count(); return _INOG; }
"*INOV"			{ count(); return _INOV; }
"*INU1"			{ count(); return _INU1; }
"*INU2"			{ count(); return _INU2; }
"*INU3"			{ count(); return _INU3; }
"*INU4"			{ count(); return _INU4; }
"*INU5"			{ count(); return _INU5; }
"*INU6"			{ count(); return _INU6; }
"*INU7"			{ count(); return _INU7; }
"*INU8"			{ count(); return _INU8; }
"*NOIND"		{ count(); return _NOIND; }
"*ONLY"			{ count(); return _ONLY; }
"*OUTPUT"		{ count(); return _OUTPUT; }
"*UPDATE"		{ count(); return _UPDATE; }

{ident}			{ count(); return _IDENTIFIER_; }
{varchar}		{ count(); return _VARCHAR_; }
{int}			{ count(); return _INT_; }
{ws}			{ count(); }
.			{ count(); return yytext[0]; }

	/* */
%%

int column = 0,
    line = 1;
static void count()
{
	int i;
#ifdef RPGLE_DEBUG
	printf(">>%s<<\n", yytext);
#endif
	for (i = 0; yytext[i] != '\0'; i++) {
		if (yytext[i] == '\n') {
			column = 0;
			line++;
		}
		else if (yytext[i] == '\t') {
			column += 8 - (column % 8);
		}
		else {
			column++;
		}
	}
}

void yyerror(const char *err)
{
	fprintf(stderr,
		"%s:%d:%d %s\n",
		"INPUT_FILE",
		line, column, err);
}
