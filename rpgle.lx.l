%{

#include "rpgle.h"
#include "y.tab.h"


static void count();

%}

%x HSPECNS FSPECNS
%option caseless

ident		[a-zA-Z_][a-zA-Z0-9_]*
varchar		'(''|[^'])*'
int		(0|[1-9][0-9]*)
ws		[\t\r\n ]+

%%

	/* H-Spec */
<*>"DCL-OPT"			{ count(); BEGIN(HSPECNS); return DCL_OPT; }
<HSPECNS>"ALLOC"		{ count(); return ALLOC; }
<HSPECNS>"ACTGRP"		{ count(); return ACTGRP; }
<HSPECNS>"ALTSEQ"		{ count(); return ALTSEQ; }
<HSPECNS>"ALWNULL"		{ count(); return ALWNULL; }
<HSPECNS>"AUT"			{ count(); return AUT; }
<HSPECNS>"BNDDIR"		{ count(); return BNDDIR; }
<HSPECNS>"CCSID"		{ count(); return CCSID; }
<HSPECNS>"CCSIDCVT"		{ count(); return CCSIDCVT; }
<HSPECNS>"COPYNEXT"		{ count(); return COPYNEXT; }
<HSPECNS>"COPYRIGHT"		{ count(); return COPYRIGHT; }
<HSPECNS>"CURSYM"		{ count(); return CURSYM; }
<HSPECNS>"CVTOPT"		{ count(); return CVTOPT; }
<HSPECNS>"DATEDIT"		{ count(); return DATEDIT; }
<HSPECNS>"DATFMT"		{ count(); return DATFMT; }
<HSPECNS>"DEBUG"		{ count(); return DEBUG; }
<HSPECNS>"DECEDIT"		{ count(); return DECEDIT; }
<HSPECNS>"DECPREC"		{ count(); return DECPREC; }
<HSPECNS>"DFTACTGRP"		{ count(); return DFTACTGRP; }
<HSPECNS>"DFTNAME"		{ count(); return DFTNAME; }
<HSPECNS>"ENBPFRCOL"		{ count(); return ENBPFRCOL; }
<HSPECNS>"EXPROPTS"		{ count(); return EXPROPTS; }
<HSPECNS>"EXTBININT"		{ count(); return EXTBININT; }
<HSPECNS>"FIXNBR"		{ count(); return FIXNBR; }
<HSPECNS>"FLTDIV"		{ count(); return FLTDIV; }
<HSPECNS>"FORMSALIGN"		{ count(); return FORMSALIGN; }
<HSPECNS>"FTRANS"		{ count(); return FTRANS; }
<HSPECNS>"GENLVL"		{ count(); return GENLVL; }
<HSPECNS>"INDENT"		{ count(); return INDENT; }
<HSPECNS>"INTPREC"		{ count(); return INTPREC; }
<HSPECNS>"LANGID"		{ count(); return LANGID; }
<HSPECNS>"MAIN"			{ count(); return MAIN; }
<HSPECNS>"NOMAIN"		{ count(); return NOMAIN; }
<HSPECNS>"OPENOPT"		{ count(); return OPENOPT; }
<HSPECNS>"OPTIMIZE"		{ count(); return OPTIMIZE; }
<HSPECNS>"OPTION"		{ count(); return OPTION; }
<HSPECNS>"PGMINFO"		{ count(); return PGMINFO; }
<HSPECNS>"PRFDTA"		{ count(); return PRFDTA; }
<HSPECNS>"SRTSEQ"		{ count(); return SRTSEQ; }
<HSPECNS>"STGMDL"		{ count(); return STGMDL; }
<HSPECNS>"TEXT"			{ count(); return TEXT; }
<HSPECNS>"THREAD"		{ count(); return THREAD; }
<HSPECNS>"TIMFMT"		{ count(); return TIMFMT; }
<HSPECNS>"TRUNCNBR"		{ count(); return TRUNCNBR; }
<HSPECNS>"USRPRF"		{ count(); return USRPRF; }
<HSPECNS>"VALIDATE"		{ count(); return VALIDATE; }

<HSPECNS>"*ALL"			{ count(); return _ALL; }
<HSPECNS>"*BASIC"		{ count(); return _BASIC; }
<HSPECNS>"*BLANK"		{ count(); return _BLANK; }
<HSPECNS>"*CALLER"		{ count(); return _CALLER; }
<HSPECNS>"*CHANGE"		{ count(); return _CHANGE; }
<HSPECNS,FSPECNS>"*CHAR"	{ count(); return _CHAR; }
<HSPECNS>"*COL"			{ count(); return _COL; }
<HSPECNS>"*CONCURRENT"		{ count(); return _CONCURRENT; }
<HSPECNS>"*DATETIME"		{ count(); return _DATETIME; }
<HSPECNS>"*DEBUGIO"		{ count(); return _DEBUGIO; }
<HSPECNS>"*DMY"			{ count(); return _DMY; }
<HSPECNS>"*DUMP"		{ count(); return _DUMP; }
<HSPECNS>"*ENTRYEXIT"		{ count(); return _ENTRYEXIT; }
<HSPECNS>"*EUR"			{ count(); return _EUR; }
<HSPECNS>"*EXCLUDE"		{ count(); return _EXCLUDE; }
<HSPECNS>"*EXCP"		{ count(); return _EXCP; }
<HSPECNS>"*EXPDDS"		{ count(); return _EXPDDS; }
<HSPECNS,FSPECNS>"*EXT"		{ count(); return _EXT; }
<HSPECNS>"*FULL"		{ count(); return _FULL; }
<HSPECNS>"*GEN"			{ count(); return _NOGEN; }
<HSPECNS>"*GRAPH"		{ count(); return _GRAPH; }
<HSPECNS>"*GRAPHIC"		{ count(); return _GRAPHIC; }
<HSPECNS>"*HEX"			{ count(); return _HEX; }
<HSPECNS>"*HMS"			{ count(); return _HMS; }
<HSPECNS>"*IGNORE"		{ count(); return _IGNORE; }
<HSPECNS>"*INHERIT"		{ count(); return _INHERIT; }
<HSPECNS,FSPECNS>"*INPUT"	{ count(); return _INPUT; }
<HSPECNS>"*INPUTONLY"		{ count(); return _INPUTONLY; }
<HSPECNS>"*INPUTPACKED"		{ count(); return _INPUTPACKED; }
<HSPECNS>"*INZOFL"		{ count(); return _INZOFL; }
<HSPECNS>"*ISO"			{ count(); return _ISO; }
<HSPECNS>"*JIS"			{ count(); return _JIS; }
<HSPECNS>"*JOB"			{ count(); return _JOB; }
<HSPECNS>"*JOBRUN"		{ count(); return _JOBRUN; }
<HSPECNS>"*LANGIDSHR"		{ count(); return _LANGIDSHR; }
<HSPECNS>"*LANGIDUNQ"		{ count(); return _LANGIDUNQ; }
<HSPECNS>"*LIBRCRTAUT"		{ count(); return _LIBRCRTAUT; }
<HSPECNS>"*LIST"		{ count(); return _LIST; }
<HSPECNS>"*MAXDIGITS"		{ count(); return _MAXDIGITS; }
<HSPECNS>"*MDY"			{ count(); return _MDY; }
<HSPECNS>"*MODULE"		{ count(); return _MODULE; }
<HSPECNS>"*NEW"			{ count(); return _NEW; }
<HSPECNS,FSPECNS>"*NO"		{ count(); return _NO; }
<HSPECNS>"*NOCOL"		{ count(); return _NOCOL; }
<HSPECNS>"*NODATETIME"		{ count(); return _NODATETIME; }
<HSPECNS>"*NODEBUGIO"		{ count(); return _NODEBUGIO; }
<HSPECNS>"*NOEXPDDS"		{ count(); return _NOEXPDDS; }
<HSPECNS>"*NOEXT"		{ count(); return _NOEXT; }
<HSPECNS>"*NOGEN"		{ count(); return _NOGEN; }
<HSPECNS>"*NOGRAPHIC"		{ count(); return _NOGRAPHIC; }
<HSPECNS>"*NOINPUTPACKED"	{ count(); return _NOINPUTPACKED; }
<HSPECNS>"*NOINZOFL"		{ count(); return _NOINZOFL; }
<HSPECNS>"*NONE"		{ count(); return _NONE; }
<HSPECNS>"*NOSECLVL"		{ count(); return _NOSECLVL; }
<HSPECNS>"*NOSHOWCPY"		{ count(); return _NOSHOWCPY; }
<HSPECNS>"*NOSHOWSKP"		{ count(); return _NOSHOWSKP; }
<HSPECNS>"*NOSRCSTMT"		{ count(); return _NOSRCSTMT; }
<HSPECNS>"*NOUNREF"		{ count(); return _NOUNREF; }
<HSPECNS>"*NOVARCHAR"		{ count(); return _NOVARCHAR; }
<HSPECNS>"*NOVARGRAPHIC"	{ count(); return _NOVARGRAPHIC; }
<HSPECNS>"*NOXREF"		{ count(); return _NOXREF; }
<HSPECNS>"*NOZONED"		{ count(); return _NOZONED; }
<HSPECNS>"*OWNER"		{ count(); return _OWNER; }
<HSPECNS>"*PCML"		{ count(); return _PCML; }
<HSPECNS>"*PEP"			{ count(); return _PEP; }
<HSPECNS>"*RESDECPOS"		{ count(); return _RESDECPOS; }
<HSPECNS>"*SECLVL"		{ count(); return _SECLVL; }
<HSPECNS>"*SERIALIZE"		{ count(); return _SERIALIZE; }
<HSPECNS>"*SHOWCPY"		{ count(); return _SHOWCPY; }
<HSPECNS>"*SHOWSKP"		{ count(); return _SHOWSKP; }
<HSPECNS>"*SNGLVL"		{ count(); return _SNGLVL; }
<HSPECNS>"*SRC"			{ count(); return _SRC; }
<HSPECNS>"*SRCMBRTXT"		{ count(); return _SRCMBRTXT; }
<HSPECNS>"*SRCSTMT"		{ count(); return _SRCSTMT; }
<HSPECNS>"*STGMDL"		{ count(); return _STGMDL; }
<HSPECNS>"*TERASPACE"		{ count(); return _TERASPACE; }
<HSPECNS>"*UCS2"		{ count(); return _UCS2; }
<HSPECNS>"*UNDEF"		{ count(); return _UNDEF; }
<HSPECNS>"*USA"			{ count(); return _USA; }
<HSPECNS>"*USE"			{ count(); return _USE; }
<HSPECNS>"*USER"		{ count(); return _USER; }
<HSPECNS>"*USRCTL"		{ count(); return _USRCTL; }
<HSPECNS>"*VARCHAR"		{ count(); return _VARCHAR; }
<HSPECNS>"*VARGRAPHIC"		{ count(); return _VARGRAPHIC; }
<HSPECNS>"*XMLSAX"		{ count(); return _XMLSAX; }
<HSPECNS>"*XREF"		{ count(); return _XREF; }
<HSPECNS,FSPECNS>"*YES"		{ count(); return _YES; }
<HSPECNS>"*YMD"			{ count(); return _YMD; }
<HSPECNS>"*ZONED"		{ count(); return _ZONED; }

	/* F-Spec */
<*>"DCL-F"			{ count(); BEGIN(FSPECNS); return DCL_F; }
<FSPECNS>"ALIAS"		{ count(); return ALIAS; }
<FSPECNS>"BLOCK"		{ count(); return BLOCK; }
<FSPECNS>"COMMIT"		{ count(); return COMMIT; }
<FSPECNS>"DEVID"		{ count(); return DEVID; }
<FSPECNS>"DISK"			{ count(); return DISK; }
<FSPECNS>"EXTDESC"		{ count(); return EXTDESC; }
<FSPECNS>"EXTFILE"		{ count(); return EXTFILE; }
<FSPECNS>"EXTIND"		{ count(); return EXTIND; }
<FSPECNS>"EXTMBR"		{ count(); return EXTMBR; }
<FSPECNS>"FORMLEN"		{ count(); return FORMLEN; }
<FSPECNS>"FORMOFL"		{ count(); return FORMOFL; }
<FSPECNS>"HANDLER"		{ count(); return HANDLER; }
<FSPECNS>"IGNORE"		{ count(); return IGNORE; }
<FSPECNS>"INCLUDE"		{ count(); return INCLUDE; }
<FSPECNS>"INDDS"		{ count(); return INDDS; }
<FSPECNS>"INFDS"		{ count(); return INFDS; }
<FSPECNS>"INFSR"		{ count(); return INFSR; }
<FSPECNS>"KEYED"		{ count(); return KEYED; }
<FSPECNS>"KEYLOC"		{ count(); return KEYLOC; }
<FSPECNS>"LIKEFILE"		{ count(); return LIKEFILE; }
<FSPECNS>"MAXDEV"		{ count(); return MAXDEV; }
<FSPECNS>"OFLIND"		{ count(); return OFLIND; }
<FSPECNS>"PASS"			{ count(); return PASS; }
<FSPECNS>"PGMNAME"		{ count(); return PGMNAME; }
<FSPECNS>"PLIST"		{ count(); return PLIST; }
<FSPECNS>"PREFIX"		{ count(); return PREFIX; }
<FSPECNS>"PRINTER"		{ count(); return PRINTER; }
<FSPECNS>"PRTCTL"		{ count(); return PRTCTL; }
<FSPECNS>"QUALIFIED"		{ count(); return QUALIFIED; }
<FSPECNS>"RAFDATA"		{ count(); return RAFDATA; }
<FSPECNS>"RECNO"		{ count(); return RECNO; }
<FSPECNS>"RENAME"		{ count(); return RENAME; }
<FSPECNS>"SAVEDS"		{ count(); return SAVEDS; }
<FSPECNS>"SEQ"			{ count(); return SEQ; }
<FSPECNS>"SFILE"		{ count(); return SFILE; }
<FSPECNS>"SLN"			{ count(); return SLN; }
<FSPECNS>"SPECIAL"		{ count(); return SPECIAL; }
<FSPECNS>"STATIC"		{ count(); return STATIC; }
<FSPECNS>"TEMPLATE"		{ count(); return TEMPLATE; }
<FSPECNS>"USAGE"		{ count(); return USAGE; }
<FSPECNS>"USROPN"		{ count(); return USROPN; }
<FSPECNS>"WORKSTN"		{ count(); return WORKSTN; }

<FSPECNS>"*COMPAT"		{ count(); return _COMPAT; }
<FSPECNS>"*DELETE"		{ count(); return _DELETE; }
<FSPECNS>"*EXTDESC"		{ count(); return _EXTDESC; }
<FSPECNS>"*FILE"		{ count(); return _FILE; }
<FSPECNS>"*IN01"		{ count(); return _IN01; }
<FSPECNS>"*IN02"		{ count(); return _IN02; }
<FSPECNS>"*IN03"		{ count(); return _IN03; }
<FSPECNS>"*IN04"		{ count(); return _IN04; }
<FSPECNS>"*IN05"		{ count(); return _IN05; }
<FSPECNS>"*IN06"		{ count(); return _IN06; }
<FSPECNS>"*IN07"		{ count(); return _IN07; }
<FSPECNS>"*IN08"		{ count(); return _IN08; }
<FSPECNS>"*IN09"		{ count(); return _IN09; }
<FSPECNS>"*IN10"		{ count(); return _IN10; }
<FSPECNS>"*IN11"		{ count(); return _IN11; }
<FSPECNS>"*IN12"		{ count(); return _IN12; }
<FSPECNS>"*IN13"		{ count(); return _IN13; }
<FSPECNS>"*IN14"		{ count(); return _IN14; }
<FSPECNS>"*IN15"		{ count(); return _IN15; }
<FSPECNS>"*IN16"		{ count(); return _IN16; }
<FSPECNS>"*IN17"		{ count(); return _IN17; }
<FSPECNS>"*IN18"		{ count(); return _IN18; }
<FSPECNS>"*IN19"		{ count(); return _IN19; }
<FSPECNS>"*IN20"		{ count(); return _IN20; }
<FSPECNS>"*IN21"		{ count(); return _IN21; }
<FSPECNS>"*IN22"		{ count(); return _IN22; }
<FSPECNS>"*IN23"		{ count(); return _IN23; }
<FSPECNS>"*IN24"		{ count(); return _IN24; }
<FSPECNS>"*IN25"		{ count(); return _IN25; }
<FSPECNS>"*IN26"		{ count(); return _IN26; }
<FSPECNS>"*IN27"		{ count(); return _IN27; }
<FSPECNS>"*IN28"		{ count(); return _IN28; }
<FSPECNS>"*IN29"		{ count(); return _IN29; }
<FSPECNS>"*IN30"		{ count(); return _IN30; }
<FSPECNS>"*IN31"		{ count(); return _IN31; }
<FSPECNS>"*IN32"		{ count(); return _IN32; }
<FSPECNS>"*IN33"		{ count(); return _IN33; }
<FSPECNS>"*IN34"		{ count(); return _IN34; }
<FSPECNS>"*IN35"		{ count(); return _IN35; }
<FSPECNS>"*IN36"		{ count(); return _IN36; }
<FSPECNS>"*IN37"		{ count(); return _IN37; }
<FSPECNS>"*IN38"		{ count(); return _IN38; }
<FSPECNS>"*IN39"		{ count(); return _IN39; }
<FSPECNS>"*IN40"		{ count(); return _IN40; }
<FSPECNS>"*IN41"		{ count(); return _IN41; }
<FSPECNS>"*IN42"		{ count(); return _IN42; }
<FSPECNS>"*IN43"		{ count(); return _IN43; }
<FSPECNS>"*IN44"		{ count(); return _IN44; }
<FSPECNS>"*IN45"		{ count(); return _IN45; }
<FSPECNS>"*IN46"		{ count(); return _IN46; }
<FSPECNS>"*IN47"		{ count(); return _IN47; }
<FSPECNS>"*IN48"		{ count(); return _IN48; }
<FSPECNS>"*IN49"		{ count(); return _IN49; }
<FSPECNS>"*IN50"		{ count(); return _IN50; }
<FSPECNS>"*IN51"		{ count(); return _IN51; }
<FSPECNS>"*IN52"		{ count(); return _IN52; }
<FSPECNS>"*IN53"		{ count(); return _IN53; }
<FSPECNS>"*IN54"		{ count(); return _IN54; }
<FSPECNS>"*IN55"		{ count(); return _IN55; }
<FSPECNS>"*IN56"		{ count(); return _IN56; }
<FSPECNS>"*IN57"		{ count(); return _IN57; }
<FSPECNS>"*IN58"		{ count(); return _IN58; }
<FSPECNS>"*IN59"		{ count(); return _IN59; }
<FSPECNS>"*IN60"		{ count(); return _IN60; }
<FSPECNS>"*IN61"		{ count(); return _IN61; }
<FSPECNS>"*IN62"		{ count(); return _IN62; }
<FSPECNS>"*IN63"		{ count(); return _IN63; }
<FSPECNS>"*IN64"		{ count(); return _IN64; }
<FSPECNS>"*IN65"		{ count(); return _IN65; }
<FSPECNS>"*IN66"		{ count(); return _IN66; }
<FSPECNS>"*IN67"		{ count(); return _IN67; }
<FSPECNS>"*IN68"		{ count(); return _IN68; }
<FSPECNS>"*IN69"		{ count(); return _IN69; }
<FSPECNS>"*IN70"		{ count(); return _IN70; }
<FSPECNS>"*IN71"		{ count(); return _IN71; }
<FSPECNS>"*IN72"		{ count(); return _IN72; }
<FSPECNS>"*IN73"		{ count(); return _IN73; }
<FSPECNS>"*IN74"		{ count(); return _IN74; }
<FSPECNS>"*IN75"		{ count(); return _IN75; }
<FSPECNS>"*IN76"		{ count(); return _IN76; }
<FSPECNS>"*IN77"		{ count(); return _IN77; }
<FSPECNS>"*IN78"		{ count(); return _IN78; }
<FSPECNS>"*IN79"		{ count(); return _IN79; }
<FSPECNS>"*IN80"		{ count(); return _IN80; }
<FSPECNS>"*IN81"		{ count(); return _IN81; }
<FSPECNS>"*IN82"		{ count(); return _IN82; }
<FSPECNS>"*IN83"		{ count(); return _IN83; }
<FSPECNS>"*IN84"		{ count(); return _IN84; }
<FSPECNS>"*IN85"		{ count(); return _IN85; }
<FSPECNS>"*IN86"		{ count(); return _IN86; }
<FSPECNS>"*IN87"		{ count(); return _IN87; }
<FSPECNS>"*IN88"		{ count(); return _IN88; }
<FSPECNS>"*IN89"		{ count(); return _IN89; }
<FSPECNS>"*IN90"		{ count(); return _IN90; }
<FSPECNS>"*IN91"		{ count(); return _IN91; }
<FSPECNS>"*IN92"		{ count(); return _IN92; }
<FSPECNS>"*IN93"		{ count(); return _IN93; }
<FSPECNS>"*IN94"		{ count(); return _IN94; }
<FSPECNS>"*IN95"		{ count(); return _IN95; }
<FSPECNS>"*IN96"		{ count(); return _IN96; }
<FSPECNS>"*IN97"		{ count(); return _IN97; }
<FSPECNS>"*IN98"		{ count(); return _IN98; }
<FSPECNS>"*IN99"		{ count(); return _IN99; }
<FSPECNS>"*INOA"		{ count(); return _INOA; }
<FSPECNS>"*INOB"		{ count(); return _INOB; }
<FSPECNS>"*INOC"		{ count(); return _INOC; }
<FSPECNS>"*INOD"		{ count(); return _INOD; }
<FSPECNS>"*INOE"		{ count(); return _INOE; }
<FSPECNS>"*INOF"		{ count(); return _INOF; }
<FSPECNS>"*INOG"		{ count(); return _INOG; }
<FSPECNS>"*INOV"		{ count(); return _INOV; }
<FSPECNS>"*INU1"		{ count(); return _INU1; }
<FSPECNS>"*INU2"		{ count(); return _INU2; }
<FSPECNS>"*INU3"		{ count(); return _INU3; }
<FSPECNS>"*INU4"		{ count(); return _INU4; }
<FSPECNS>"*INU5"		{ count(); return _INU5; }
<FSPECNS>"*INU6"		{ count(); return _INU6; }
<FSPECNS>"*INU7"		{ count(); return _INU7; }
<FSPECNS>"*INU8"		{ count(); return _INU8; }
<FSPECNS>"*NOIND"		{ count(); return _NOIND; }
<FSPECNS>"*ONLY"		{ count(); return _ONLY; }
<FSPECNS>"*OUTPUT"		{ count(); return _OUTPUT; }
<FSPECNS>"*UPDATE"		{ count(); return _UPDATE; }

<*>{ident}			{ count(); return _IDENTIFIER_; }
<*>{varchar}			{ count(); return _VARCHAR_; }
<*>{int}			{ count(); return _INT_; }
<*>{ws}				{ count(); }
<*>.				{ count(); return yytext[0]; }

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
