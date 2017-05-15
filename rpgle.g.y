%{
#include "rpgle.h"
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yyerror(const char *);
%}

%start root

%define parse.error verbose

%token STR

/* H-Spec */
%token DCL_OPT

%token DEBUG _YES
%token DATEDIT _MDY _DMY _YMD _ISO _USA _EUR
%token OPTION _NOXREF _XREF _NOGEN _GEN _NOSECLVL _SECLVL _NOSHOWCPY _SHOWCPY
%token _NOEXPDDS _EXPDDS _NOSRCSTMT _SRCSTMT _NODEBUGIO _DEBUGIO
%token DATFMT /*_MDY*/ /*_DMY*/ /*_YMD*/ /*_ISO*/ /*_USA*/ /*_EUR*/
%token TIMFMT _HMS /*_ISO*/ /*_USA*/ /*_EUR*/
%token ACTGRP _NEW _CALLER /*STR*/

%token AUT _LIBRCRTAUT _ALL _CHANGE _USE _EXCLUDE /*STR*/
%token BNDDIR /*STR*/

/* D-Spec */
%token DCL_S DCL_C DCL_PI END_PI
%token EXTPROC INZ CONST LIKE LIKEDS LIKEREC POS
%token CHAR VARCHAR UCS VARUCS GRAPH IND PACKED ZONED BINDEC
%token INT UNS FLOAT DATE TIME TIMESTAMP POINTER OBJECT
%token DIM VALUE OPTIONS DCL_PARM
%token _N

/* P-Spec */
%token DCL_PROC END_PROC DCL_PR END_PR
%token EXPORT

/* F-Spec */
%token DCL_F
%token USAGE DISK PRINTER SEQ SPECIAL WORKSTN KEYED EXTDESC
%token _EXT _INPUT _OUTPUT

/* C-Spec */
%token IF ELSEIF ELSE ENDIF
%token DOW DOU ENDDO
%token FOR BY TO DOWNTO ENDFOR

%token AND_OP OR_OP LE_OP GE_OP NE_OP

%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN

%%

root
	: hspec /* fspec dspec ispec cspec ospec pspec */

hspec
	: /* Empty */
	| DCL_OPT hspec_kws ';' hspec
	| DCL_OPT ';' hspec

hspec_kws
	: hspec_kw
	| hspec_kw hspec_kws

hspec_kw
	: DEBUG '(' hspec_debug ')'
	| DATEDIT '(' hspec_datedit ')'
	| OPTION '(' hspec_options ')'
	| DATFMT '(' hspec_datfmt ')'
	| TIMFMT '(' hspec_timfmt ')'
	| ACTGRP '(' hspec_actgrp ')'
	| AUT '(' hspec_aut ')'
	| BNDDIR '(' hspec_bindirs ')'

hspec_debug
	: _YES

hspec_datedit
	: _MDY
	| _DMY
	| _YMD
	| _ISO
	| _USA
	| _EUR

hspec_options
	: hspec_option
	| hspec_option hspec_options

hspec_option
	: _NOXREF
	| _XREF
	| _NOGEN
	| _GEN
	| _NOSECLVL
	| _SECLVL
	| _NOSHOWCPY
	| _SHOWCPY
	| _NOEXPDDS
	| _EXPDDS
	| _NOSRCSTMT
	| _SRCSTMT
	| _NODEBUGIO
	| _DEBUGIO

hspec_datfmt
	: _MDY
	| _DMY
	| _YMD
	| _ISO
	| _USA
	| _EUR

hspec_timfmt
	: _HMS
	| _ISO
	| _USA
	| _EUR

hspec_actgrp
	: _NEW
	| _CALLER
	| STR

hspec_aut
	: _LIBRCRTAUT
	| _ALL
	| _CHANGE
	| _USE
	| _EXCLUDE
	| STR

hspec_bindirs
	: STR
	| STR ':' hspec_bindirs
