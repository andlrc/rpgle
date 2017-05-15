#include "rpgle.h"
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern int yyparse(void);
extern void yyerror(const char *);

int main(void)
{
	yyparse();
	printf("Hello World!\n");
	return 0;
}
