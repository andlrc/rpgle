%{
#include "rpgle.h"
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yyerror(const char *);
%}

%start root

%define parse.error verbose

%union {
	char *str;
	int inum;
	double dnum;
	dclc_t *dclc;
	dclpi_t *dclpi;
	parameter_t **parameters;
	parameter_t *parameter;
	identtype_t *identtype;
	value_t *value;
}

%token <str> IDENT INDICATOR IDENTTYPE STR;
%token <inum> INUM
%token <dnum> DNUM

%token DCLC CONST;
%token DCLPI ENDPI;
%token DCLPROC EXPORT ENDPROC;

%type <dclc> dclc;
%type <dclpi> dclpi;
%type <parameters> parameters;
%type <parameter> parameter;
%type <identtype> identtype;
%type <value> value;

%%

root:	head tail
head:	dspec
    |	dclproc
    |	head;

tail:	cspec
    |	dclproc;

dspec:	dclpr dcls dclc dclds dclpi;
cspec:	;

dclproc:	DCLPROC IDENT EXPORT ';' dclpi dspec cspec ENDPROC ';' {
	printf("%s - export\n", $2);
       }
       |	DCLPROC IDENT ';' dclpi dspec cspec ENDPROC ';' {
	printf("%s\n", $2);
       }

dclpr:	;
dcls:	;
dclds:	;

dclc:	/* Empty */ {
	$$ = NULL;
    }
    |	DCLC IDENT value ';' {
	$$ = malloc(sizeof(dclc_t));
	$$->name = $2;
	$$->value_type = $3->type;
	$$->value = $3->value;
	/* TODO: Free value */
    }
    |	DCLC IDENT CONST '(' value ')' ';' {
	$$ = malloc(sizeof(dclc_t));
	$$->name = $2;
	$$->value_type = $5->type;
	$$->value = $5->value;
	/* TODO: Free value */
    }

dclpi:	/* Empty */ {
	$$ = NULL;
     }
     |	DCLPI IDENT identtype ';' parameters ENDPI ';' {
	$$ = malloc(sizeof(dclpi_t));
	$$->name = $2;
	$$->parameters = $5;
     }
     |	DCLPI INDICATOR identtype ';' parameters ENDPI ';' {
	$$ = malloc(sizeof(dclpi_t));
	$$->name = NULL;
	$$->parameters = $5;
     }

identtype:	IDENTTYPE {
		$$->type = lookup_identtype($1);
	 }
	 |	IDENTTYPE '(' INUM ')' {
		$$ = malloc(sizeof(identtype_t));
		$$->type = lookup_identtype($1);
		free($1);
		$$->arg1.inum = $3;
		$$->arg2.inum = 0;
	 }
	 |	IDENTTYPE '(' INUM ':' INUM ')' {
		$$ = malloc(sizeof(identtype_t));
		$$->type = lookup_identtype($1);
		free($1);
		$$->arg1.inum = $3;
		$$->arg2.inum = $5;
	 }
	 |	IDENTTYPE '(' INDICATOR ')' {
		$$ = malloc(sizeof(identtype_t));
		$$->type = lookup_identtype($1);
		free($1);
		$$->arg1.str = $3;
		$$->arg2.str = NULL;
	 }
	 |	IDENTTYPE '(' INDICATOR ':' IDENT ')' {
		$$ = malloc(sizeof(identtype_t));
		$$->type = lookup_identtype($1);
		free($1);
		$$->arg1.str = $3;
		$$->arg2.str = $5;
	 }

parameters:	{
			$$ = NULL;
		}
	  |	parameter {
		$$ = malloc(sizeof(parameter_t *) * 2);
		$$[0] = $1;
		$$[1] = NULL;
	  }
	  |	parameter parameter {
		$$ = malloc(sizeof(parameter_t *) * 3);
		$$[0] = $1;
		$$[1] = $2;
		$$[2] = NULL;
	  }
	  |	parameter parameter parameter {
		$$ = malloc(sizeof(parameter_t *) * 4);
		$$[0] = $1;
		$$[1] = $2;
		$$[2] = $3;
		$$[3] = NULL;
	  }
	  |	parameter parameter parameter parameter {
		$$ = malloc(sizeof(parameter_t *) * 5);
		$$[0] = $1;
		$$[1] = $2;
		$$[2] = $3;
		$$[3] = $4;
		$$[4] = NULL;
	  }

parameter:	IDENT identtype ';' {
		$$ = malloc(sizeof(parameter_t));
		$$->name = $1;
		$$->identtype = $2;
	 }

value:	STR {
	$$ = malloc(sizeof(value_t));
	$$->type = VALUE_TYPE_STR;
	$$->value.str = $1;
     }
     |	DNUM {
	$$ = malloc(sizeof(value_t));
	$$->type = VALUE_TYPE_DNUM;
	$$->value.dnum = $1;
     }

%%
