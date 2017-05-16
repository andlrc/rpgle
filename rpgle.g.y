%{
#include "rpgle.h"
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yyerror(const char *);
%}

%start root

%define parse.error verbose

%token _VARCHAR_ _CHAR_ _INT_ _IDENTIFIER_

/* H-Spec */
%token DCL_OPT ALLOC ACTGRP ALTSEQ ALWNULL AUT BNDDIR CCSID CCSIDCVT
%token COPYNEXT COPYRIGHT CURSYM CVTOPT DATEDIT DATFMT DEBUG DECEDIT
%token DECPREC DFTACTGRP DFTNAME ENBPFRCOL EXPROPTS EXTBININT FIXNBR
%token FLTDIV FORMSALIGN FTRANS GENLVL INDENT INTPREC LANGID MAIN
%token NOMAIN OPENOPT OPTIMIZE OPTION PGMINFO PRFDTA SRTSEQ STGMDL
%token TEXT THREAD TIMFMT TRUNCNBR USRPRF VALIDATE

%token _ALL _BASIC _BLANK _CALLER _CHANGE _CHAR _COL _CONCURRENT
%token _DATETIME _DEBUGIO _DMY _DUMP _ENTRYEXIT _EUR _EXCLUDE
%token _EXCP _EXPDDS _EXT _FULL _GEN _GRAPH _GRAPHIC _HEX _HMS
%token _IGNORE _INHERIT _INPUT _INPUTONLY _INPUTPACKED _INZOFL _ISO
%token _JIS _JOB _JOBRUN _LANGIDSHR _LANGIDUNQ _LIBRCRTAUT _LIST
%token _MAXDIGITS _MDY _MODULE _NEW _NO _NOCOL _NODATETIME
%token _NODEBUGIO _NOEXPDDS _NOEXT _NOGEN _NOGRAPHIC _NOINPUTPACKED
%token _NOINZOFL _NONE _NOSECLVL _NOSHOWCPY _NOSHOWSKP _NOSRCSTMT
%token _NOUNREF _NOVARCHAR _NOVARGRAPHIC _NOXREF _NOZONED _OWNER
%token _PCML _PEP _RESDECPOS _SECLVL _SERIALIZE _SHOWCPY _SHOWSKP
%token _SNGLVL _SRC _SRCMBRTXT _SRCSTMT _STGMDL _TERASPACE _UCS2
%token _UNDEF _USA _USE _USER _USRCTL _VARCHAR _VARGRAPHIC _XMLSAX
%token _XREF _YES _YMD _ZONED

/* F-Spec */
%token DCL_F ALIAS BLOCK COMMIT DEVID DISK EXTDESC EXTFILE EXTIND
%token EXTMBR FORMOFL FORMLEN HANDLER IGNORE INCLUDE INDDS INFDS
%token INFSR KEYED KEYLOC LIKEFILE MAXDEV OFLIND PASS PGMNAME PLIST
%token PREFIX PRINTER PRTCTL QUALIFIED RAFDATA RECNO RENAME SAVEDS
%token SEQ SFILE SLN SPECIAL STATIC TEMPLATE USAGE USROPN WORKSTN

%token _COMPAT _DELETE _EXTDESC _FILE
%token _IN01 _IN02 _IN03 _IN04 _IN05 _IN06 _IN07 _IN08 _IN09 _IN10
%token _IN11 _IN12 _IN13 _IN14 _IN15 _IN16 _IN17 _IN18 _IN19 _IN20
%token _IN21 _IN22 _IN23 _IN24 _IN25 _IN26 _IN27 _IN28 _IN29 _IN30
%token _IN31 _IN32 _IN33 _IN34 _IN35 _IN36 _IN37 _IN38 _IN39 _IN40
%token _IN41 _IN42 _IN43 _IN44 _IN45 _IN46 _IN47 _IN48 _IN49 _IN50
%token _IN51 _IN52 _IN53 _IN54 _IN55 _IN56 _IN57 _IN58 _IN59 _IN60
%token _IN61 _IN62 _IN63 _IN64 _IN65 _IN66 _IN67 _IN68 _IN69 _IN70
%token _IN71 _IN72 _IN73 _IN74 _IN75 _IN76 _IN77 _IN78 _IN79 _IN80
%token _IN81 _IN82 _IN83 _IN84 _IN85 _IN86 _IN87 _IN88 _IN89 _IN90
%token _IN91 _IN92 _IN93 _IN94 _IN95 _IN96 _IN97 _IN98 _IN99 _INOA
%token _INOB _INOC _INOD _INOE _INOF _INOG _INOV _INU1 _INU2 _INU3
%token _INU4 _INU5 _INU6 _INU7 _INU8 _NOIND _ONLY _OUTPUT _UPDATE

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
	: ALLOC '(' hspec_alloc ')'
	| ACTGRP '(' hspec_actgrp ')'
	| ALTSEQ '(' hspec_altseq ')'
	| ALWNULL '(' hspec_alwnull ')'
	| AUT '(' hspec_aut ')'
	| BNDDIR '(' hspec_bnddir ')'
	| CCSID '(' hspec_ccsid ')'
	| CCSIDCVT '(' hspec_ccsidcvt ')'
	| COPYNEXT '(' hspec_copynext ')'
	| COPYRIGHT '(' hspec_copyright ')'
	| CURSYM '(' hspec_cursym ')'
	| CVTOPT '(' hspec_cvtopt ')'
	| DATEDIT '(' hspec_datedit ')'
	| DATFMT '(' hspec_datfmt ')'
	| DEBUG
	| DEBUG '(' hspec_debug ')'
	| DECEDIT '(' hspec_decedit ')'
	| DECPREC '(' hspec_decprec ')'
	| DFTACTGRP '(' hspec_dftactgrp ')'
	| DFTNAME '(' hspec_dftname ')'
	| ENBPFRCOL '(' hspec_enbpfrcol ')'
	| EXPROPTS '(' hspec_expropts ')'
	| EXTBININT
	| EXTBININT '(' hspec_extbinint ')'
	| FIXNBR '(' hspec_fixnbr ')'
	| FLTDIV
	| FLTDIV '(' hspec_fltdiv ')'
	| FORMSALIGN
	| FORMSALIGN '(' hspec_formsalign ')'
	| FTRANS
	| FTRANS '(' hspec_ftrans ')'
	| GENLVL '(' hspec_genlvl ')'
	| INDENT '(' hspec_indent ')'
	| INTPREC '(' hspec_intprec ')'
	| LANGID '(' hspec_langid ')'
	| MAIN '(' hspec_main ')'
	| NOMAIN
	| OPENOPT '(' hspec_openopt ')'
	| OPTIMIZE '(' hspec_optimize ')'
	| OPTION '(' hspec_option ')'
	| PGMINFO '(' hspec_pgminfo ')'
	| PRFDTA '(' hspec_prfdta ')'
	| SRTSEQ '(' hspec_srtseq ')'
	| STGMDL '(' hspec_stgmdl ')'
	| TEXT '(' hspec_text ')'
	| THREAD '(' hspec_thread ')'
	| TIMFMT '(' hspec_timfmt ')'
	| TRUNCNBR '(' hspec_truncnbr ')'
	| USRPRF '(' hspec_usrprf ')'
	| VALIDATE '(' hspec_validate ')'

hspec_alloc
	: _STGMDL
	| _TERASPACE
	| _SNGLVL

hspec_actgrp
	: _STGMDL
	| _NEW
	| _CALLER
	| _VARCHAR_

hspec_altseq
	: _NONE
	| _SRC
	| _EXT

hspec_alwnull
	: _NO
	| _INPUTONLY
	| _USRCTL

hspec_aut
	: _LIBRCRTAUT
	| _ALL
	| _CHANGE
	| _USE
	| _EXCLUDE
	| _VARCHAR_

hspec_bnddir
	: _VARCHAR_
	| _VARCHAR_ ':' hspec_bnddir

hspec_ccsid
	: _GRAPH ':' _IGNORE
	| _GRAPH ':' _SRC
	| _GRAPH ':' _INT_
	| _UCS2 ':' _INT_
	| _CHAR ':' _JOBRUN

hspec_ccsidcvt
	: _EXCP
	| _LIST

hspec_copynext
	: _INT_

hspec_copyright
	: _VARCHAR_

hspec_cursym
	: _CHAR_

hspec_cvtopt
	: /* Empty */
	| _DATETIME hspec_cvtopt
	| _NODATETIME hspec_cvtopt
	| _GRAPHIC hspec_cvtopt
	| _NOGRAPHIC hspec_cvtopt
	| _VARCHAR hspec_cvtopt
	| _NOVARCHAR hspec_cvtopt
	| _VARGRAPHIC hspec_cvtopt
	| _NOVARGRAPHIC hspec_cvtopt

hspec_datedit
	: _DMY hspec_datedit_sep
	| _MDY hspec_datedit_sep
	| _YMD hspec_datedit_sep
	| _ISO
	| _ISO '-'
	| _USA
	| _USA '/'
	| _EUR
	| _EUR '.'
	| _JIS
	| _JIS '-'

hspec_datedit_sep
	: /* Empty */
	| '/'
	| '-'
	| '.'
	| ','
	| '&'

hspec_datfmt
	: _DMY
	| _MDY
	| _YMD
	| _DMY hspec_datfmt_sep
	| _MDY hspec_datfmt_sep
	| _YMD hspec_datfmt_sep

hspec_datfmt_sep
	: '.'
	| ','

hspec_debug
	: _INPUT
	| _DUMP
	| _XMLSAX
	| _NO
	| _YES

hspec_decedit
	: _JOBRUN
	| _VARCHAR_

hspec_decprec
	: _INT_

hspec_dftactgrp
	: _YES
	| _NO

hspec_dftname
	: _VARCHAR_

hspec_enbpfrcol
	: _PEP
	| _ENTRYEXIT
	| _FULL

hspec_expropts
	: _MAXDIGITS
	| _RESDECPOS

hspec_extbinint
	: _NO
	| _YES

hspec_fixnbr
	: /* Empty */
	| _NOZONED hspec_fixnbr
	| _ZONED hspec_fixnbr
	| _NOINPUTPACKED hspec_fixnbr
	| _INPUTPACKED hspec_fixnbr

hspec_fltdiv
	: _NO
	| _YES

hspec_formsalign
	: _NO
	| _YES

hspec_ftrans
	: _NONE
	| _SRC

hspec_genlvl
	: _INT_

hspec_indent
	: _NONE
	| _VARCHAR_

hspec_intprec
	: _INT_

hspec_langid
	: _JOBRUN
	| _JOB
	| _VARCHAR_

hspec_main
	: _IDENTIFIER_

hspec_openopt
	: _NOINZOFL
	| _INZOFL

hspec_optimize
	: _NONE
	| _BASIC
	| _FULL

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
	| _NOEXT
	| _EXT
	| _NOSHOWSKP
	| _SHOWSKP
	| _NOSRCSTMT
	| _SRCSTMT
	| _NODEBUGIO
	| _DEBUGIO
	| _NOUNREF
	| _UNDEF
	| _NOXREF ':' hspec_option
	| _XREF ':' hspec_option
	| _NOSECLVL ':' hspec_option
	| _SECLVL ':' hspec_option
	| _NOSHOWCPY ':' hspec_option
	| _SHOWCPY ':' hspec_option
	| _NOEXPDDS ':' hspec_option
	| _EXPDDS ':' hspec_option
	| _NOEXT ':' hspec_option
	| _EXT ':' hspec_option
	| _NOSHOWSKP ':' hspec_option
	| _SHOWSKP ':' hspec_option
	| _NOSRCSTMT ':' hspec_option
	| _SRCSTMT ':' hspec_option
	| _NODEBUGIO ':' hspec_option
	| _DEBUGIO ':' hspec_option
	| _NOUNREF ':' hspec_option
	| _UNDEF ':' hspec_option

hspec_pgminfo
	: _PCML
	| _NO
	| _NO ':' _MODULE

hspec_prfdta
	: _NOCOL
	| _COL

hspec_srtseq
	: _HEX
	| _JOB
	| _JOBRUN
	| _LANGIDUNQ
	| _LANGIDSHR
	| _VARCHAR_

hspec_stgmdl
	: _INHERIT
	| _SNGLVL
	| _TERASPACE

hspec_text
	: _SRCMBRTXT
	| _BLANK
	| _VARCHAR_

hspec_thread
	: _CONCURRENT
	| _SERIALIZE

hspec_timfmt
	: _HMS
	| _HMS '.'
	| _HMS ','
	| _HMS '&'
	| _ISO
	| _ISO '.'
	| _USA
	| _USA ':'
	| _EUR
	| _EUR '.'
	| _JIS
	| _JIS ':'

hspec_truncnbr
	: _YES
	| _NO

hspec_usrprf
	: _USER
	| _OWNER

hspec_validate
	: _NODATETIME

/* F-Spec */

fspec
	: /* Empty */
	| DCL_F _IDENTIFIER_ fspec_kws ';' fspec
	| DCL_F _IDENTIFIER_ ';' fspec

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
	| PLIST '(' fspec_plist ')'
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
	| _IN01
	| _IN02
	| _IN03
	| _IN04
	| _IN05
	| _IN06
	| _IN07
	| _IN08
	| _IN09
	| _IN10
	| _IN11
	| _IN12
	| _IN13
	| _IN14
	| _IN15
	| _IN16
	| _IN17
	| _IN18
	| _IN19
	| _IN20
	| _IN21
	| _IN22
	| _IN23
	| _IN24
	| _IN25
	| _IN26
	| _IN27
	| _IN28
	| _IN29
	| _IN30
	| _IN31
	| _IN32
	| _IN33
	| _IN34
	| _IN35
	| _IN36
	| _IN37
	| _IN38
	| _IN39
	| _IN40
	| _IN41
	| _IN42
	| _IN43
	| _IN44
	| _IN45
	| _IN46
	| _IN47
	| _IN48
	| _IN49
	| _IN50
	| _IN51
	| _IN52
	| _IN53
	| _IN54
	| _IN55
	| _IN56
	| _IN57
	| _IN58
	| _IN59
	| _IN60
	| _IN61
	| _IN62
	| _IN63
	| _IN64
	| _IN65
	| _IN66
	| _IN67
	| _IN68
	| _IN69
	| _IN70
	| _IN71
	| _IN72
	| _IN73
	| _IN74
	| _IN75
	| _IN76
	| _IN77
	| _IN78
	| _IN79
	| _IN80
	| _IN81
	| _IN82
	| _IN83
	| _IN84
	| _IN85
	| _IN86
	| _IN87
	| _IN88
	| _IN89
	| _IN90
	| _IN91
	| _IN92
	| _IN93
	| _IN94
	| _IN95
	| _IN96
	| _IN97
	| _IN98
	| _IN99
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

fspec_sln
	: _INT_

fspec_special
	: _EXT
	| _INT_


fspec_timfmt
	: _HMS fspec_timfmt_sep
	| _ISO
	| _ISO '.'
	| _USA
	| _USA ':'
	| _EUR
	| _EUR '.'
	| _JIS
	| _JIS ':'

fspec_timfmt_sep
	: /* Empty */
	| ':'
	| '.'
	| ','
	| '&'

fspec_usage
	: _INPUT
	| _OUTPUT
	| _UPDATE
	| _DELETE
	| _INPUT ':' fspec_usage
	| _OUTPUT ':' fspec_usage
	| _UPDATE ':' fspec_usage
	| _DELETE ':' fspec_usage

fspec_workstn
	: _EXT
	| _INT_
