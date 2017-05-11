#include "rpgle.h"
#include "rpgle.g.h"
extern int yyparse(void);
#include <stdio.h>

int main(void)
{
	yyparse();
	printf("Hello World!\n");
	return 0;
}
