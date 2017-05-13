#include "rpgle.h"
#include "rpgle.g.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern int yyparse(void);
extern void yyerror(const char *);

struct identtype_symtab_s {
	char *ident;
	enum identtype_e type;
} identtype_symtab[] = {
	{ "char", IDENTTYPE_CHAR },
	{ "varchar", IDENTTYPE_VARCHAR },
	{ "ucs", IDENTTYPE_UCS },
	{ "varucs", IDENTTYPE_VARUCS },
	{ "graph", IDENTTYPE_GRAPH },
	{ "ind", IDENTTYPE_IND },
	{ "packed", IDENTTYPE_PACKED },
	{ "zoned", IDENTTYPE_ZONED },
	{ "bindec", IDENTTYPE_BINDEC },
	{ "int", IDENTTYPE_INT },
	{ "uns", IDENTTYPE_UNS },
	{ "float", IDENTTYPE_FLOAT },
	{ "date", IDENTTYPE_DATE },
	{ "time", IDENTTYPE_TIME },
	{ "timestamp", IDENTTYPE_TIMESTAMP },
	{ "pointer", IDENTTYPE_POINTER },
	{ "object", IDENTTYPE_OBJECT }
};

enum identtype_e lookup_identtype(char * key)
{
	struct identtype_symtab_s *tab;
	for (tab = identtype_symtab;
	     tab < identtype_symtab + (sizeof(identtype_symtab)
				     / sizeof(struct identtype_symtab_s));
	     tab++) {
		if (strcmp(tab->ident, key) == 0)
			return tab->type;
	}

	yyerror("Cannot lookup identifier");
	exit(1);
}

int main(void)
{
	yyparse();
	printf("Hello World!\n");
	return 0;
}
