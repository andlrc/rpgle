%{
#include "rpgle.h"
#include <stdio.h>

extern int yylex();
extern int yyerror(const char *);
%}

%start root

%define parse.error verbose

%union {
	char * str;
	dcl_pi_t *dcl_pi;
	parameter_t **parameters;
}

%token <str> IDENT
%token DCLPROC EXPORT ENDPROC;
%token DCLPI STAR_N ENDPI;

%type <dcl_pi> dclpi;
%type <parameters> parameters;

%%

root:	dspec;
dspec:	dclproc | procbody;
dclproc:	DCLPROC IDENT EXPORT ';' dclpi procbody ENDPROC ';' {
       	printf("%s - export\n", $2);
       }
       |	DCLPROC IDENT ';' dclpi procbody ENDPROC ';' {
       	printf("%s\n", $2);
       }

dclpi:	/* Empty */ {
     	$$ = NULL;
     }
     |	DCLPI IDENT identtype ';' parameters ENDPI ';' {
     	$$ = malloc(sizeof(dcl_pi_t));
	$$->name = $2;
	$$->parameters = $5;
     }
     |	DCLPI STAR_N identtype ';' parameters ENDPI ';' {
     	$$ = malloc(sizeof(dcl_pi_t));
	$$->name = NULL;
	$$->parameters = $5;
     }

identtype:	IDENTTYPE
	 |	IDENTTYPE '(' digit ')';

parameters:	;

procbody: ;

%%
