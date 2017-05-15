%{
#include "rpgle.h"
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yyerror(const char *);
%}

%start root

%define parse.error verbose

%token _VARCHAR_

/* H-Spec */
%token DCL_OPT

%token DEBUG _YES
%token DATEDIT _MDY _DMY _YMD _ISO _USA _EUR
%token OPTION _NOXREF _XREF _NOGEN _GEN _NOSECLVL _SECLVL _NOSHOWCPY _SHOWCPY
%token _NOEXPDDS _EXPDDS _NOSRCSTMT _SRCSTMT _NODEBUGIO _DEBUGIO
%token DATFMT /*_MDY*/ /*_DMY*/ /*_YMD*/ /*_ISO*/ /*_USA*/ /*_EUR*/
%token TIMFMT _HMS /*_ISO*/ /*_USA*/ /*_EUR*/
%token ACTGRP _NEW _CALLER /*_VARCHAR_*/

%token AUT _LIBRCRTAUT _ALL _CHANGE _USE _EXCLUDE /*_VARCHAR_*/
%token BNDDIR /*_VARCHAR_*/

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
	: hspec fspec /* dspec ispec cspec ospec pspec */

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
	: _MDY hspec_datfmt_sep
	| _DMY hspec_datfmt_sep
	| _YMD hspec_datfmt_sep
	| _ISO hspec_datfmt_sep
	| _USA hspec_datfmt_sep
	| _EUR hspec_datfmt_sep

hspec_datfmt_sep
	: /* Empty */
	| '.'
	| ','

hspec_timfmt
	: _HMS hspec_timfmt_sep
	| _ISO hspec_timfmt_sep
	| _USA hspec_timfmt_sep
	| _EUR hspec_timfmt_sep

hspec_timfmt_sep
	: /* Empty */
	| '.'
	| ','

hspec_actgrp
	: _NEW
	| _CALLER
	| _VARCHAR_

hspec_aut
	: _LIBRCRTAUT
	| _ALL
	| _CHANGE
	| _USE
	| _EXCLUDE
	| _VARCHAR_

hspec_bindirs
	: _VARCHAR_
	| _VARCHAR_ ':' hspec_bindirs

fspec
	: /* Empty */
	| DCL_F identifier fspec_kws ';'
	| DCL_F identifier ';'

fspec_kws
	: fspec_kw
	| fspec_kw fspec_kws

fspec_kw
	: ALIAS
	| ALIAS '(' fspec_alias ')'
	| BLOCK '(' fspec_block ')'
	| COMMIT
	| COMMIT '(' fspec_commit ')'
	| DATFMT '(' fspec_datfmt ')'
	| DEVID '(' fspec_devid ')'
	| DISK
	| DISK '(' fspec_disk ')'
	| EXTDESC '(' fspec_extdesc ')'
	| EXTFILE '(' fspec_extfile ')'
	| EXTIND '(' fspec_extind ')'
	| EXTMBR '(' fspec_extmbr ')'
	| FORMLEN '(' fspec_formlen ')'
	| FORMOFL '(' fspec_formofl ')'
	| HANDLER '(' fspec_handler ')'
	| IGNORE '(' fspec_ignore ')'
	| INCLUDE '(' fspec_include ')'
	| INDDS '(' fspec_indds ')'
	| INFDS '(' fspec_infds ')'
	| INFSR '(' fspec_infsr ')'
	| KEYED
	| KEYED '(' fspec_keyed ')'
	| KEYLOC '(' fspec_keyloc ')'
	| LIKEFILE '(' fspec_likefile ')'
	| MAXDEV '(' fspec_maxdev ')'
	| OFLIND '(' fspec_oflind ')'
	| PASS '(' fspec_pass ')'
	| PGMNAME '(' fspec_pgmname ')'
	| PLIST '(' fpsec_plist ')'
	| PREFIX '(' fspec_prefix ')'
	| PRINTER
	| PRINTER '(' fspec_printer ')'
	| PRTCTL '(' fspec_prtctl ')'
	| QUALIFIED
	| RAFDATA '(' fspec_rafdata ')'
	| RECNO '(' fspec_recno ')'
	| RENAME '(' fspec_rename ')'
	| SAVEDS '(' fspec_saveds ')'
	| SEQ
	| SEQ '(' fspec_seq ')'
	| SFILE '(' fspec_sfile ')'
	| SLN '(' fspec_sln ')'
	| SPECIAL
	| SPECIAL '(' fspec_special ')'
	| STATIC
	| TEMPLATE
	| TIMFMT '(' fspec_timfmt ')'
	| USAGE '(' fspec_usage ')'
	| USROPN
	| WORKSTN
	| WORKSTN '(' fspec_workstn ')'

fspec_alias
	: _IDENTIFIER_

fspec_block
	: _YES
	| _NO

fspec_commit
	: _IDENTIFIER_

fspec_datfmt
	: _MDY fspec_datfmt_sep
	| _DMY fspec_datfmt_sep
	| _YMD fspec_datfmt_sep
	| _ISO fspec_datfmt_sep
	| _USA fspec_datfmt_sep
	| _EUR fspec_datfmt_sep

fspec_datfmt_sep
	: /* Empty */
	| '.'
	| ','

fspec_devid
	: _IDENTIFIER_

fspec_disk
	: _EXT
	| _INT_

fspec_extdesc
	: _IDENTIFIER_

fspec_extfile
	: _EXTDESC
	| _IDENTIFIER_

fspec_extind
	: _INU1
	| _INU2
	| _INU3
	| _INU4
	| _INU5
	| _INU6
	| _INU7
	| _INU8

fspec_extmbr
	: _IDENTIFIER_

fspec_formlen
	: _INT_

fspec_formofl
	: _INT_

fspec_handler
	: _VARCHAR_
	| _VARCHAR_ ':' _IDENTIFIER_

fspec_ignore
	: _IDENTIFIER_
	| _IDENTIFIER_ ':' fspec_ignore

fspec_include
	: _IDENTIFIER_
	| _IDENTIFIER_ ':' fspec_include
	
fspec_indds
	: _IDENTIFIER_
	
fspec_infds
	: _IDENTIFIER_

fspec_infsr
	: _IDENTIFIER_

fspec_keyed
	: _CHAR ':' _INT_

fspec_keyloc
	: _INT_

fspec_likefile
	: _IDENTIFIER_

fspec_maxdev
	: _ONLY
	| _FILE

fspec_oflind
	: _INOA
	| _INOB
	| _INOC
	| _INOD
	| _INOE
	| _INOF
	| _INOG
	| _INOV
	| _IN01 .. _IN99
	| _IDENTIFIER_

fspec_pass
	: _NOIND

fspec_pgmname
	: _IDENTIFIER_

fspec_plist
	: _IDENTIFIER_

fspec_prefix
	: _VARCHAR_
	| _VARCHAR_ ':' _INT_

fspec_printer
	: _EXT
	| _INT_

fspec_prtctl
	: _IDENTIFIER_
	| _IDENTIFIER_ ':' _COMPAT

fspec_rafdata
	: _IDENTIFIER_

fspec_recno
	: _IDENTIFIER_

fspec_rename
	: _IDENTIFIER_ ':' _IDENTIFIER_

fspec_saveds
	: _IDENTIFIER_

fspec_seq
	: _EXT
	| _INT_

fspec_sfile
	: _IDENTIFIER_ ':' _IDENTIFIER_

fspec_special
	: _EXT
	| _INT_


fspec_timfmt
	: _HMS fspec_timfmt_sep
	| _ISO fspec_timfmt_sep
	| _USA fspec_timfmt_sep
	| _EUR fspec_timfmt_sep

fspec_timfmt_sep
	: /* Empty */
	| '.'
	| ','

fspec_usage
	: _INPUT
	| _OUTPUT
	| _UPDATE
	| _DELETE
	: _INPUT ':' fspec_usage
	| _OUTPUT ':' fspec_usage
	| _UPDATE ':' fspec_usage
	| _DELETE ':' fspec_usage

fspec_workstn
	: _EXT
	| _INT_
