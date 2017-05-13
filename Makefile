CFLAGS	= -O -Wall -Werror -Wno-unused-function
DFLAGS	= -g -Wall -Werror -Wno-unused-function -DDEBUG
YFLAGS	= -d

OFILES	= rpgle.o rpgle.g.o rpgle.lx.o

rpgle:	rpgle.h rpgle.g.h $(OFILES)
	$(CC) $(CFLAGS) -o rpgle $(OFILES) -lfl -ly

rpgle.g.o:	rpgle.h rpgle.g.y
rpgle.lx.o:	rpgle.h rpgle.g.h rpgle.lx.l

y.tab.h:	rpgle.g.o
rpgle.g.h:	y.tab.h
	cp y.tab.h rpgle.g.h

rpgle.o:	rpgle.c

debug:	clean
	$(MAKE) CFLAGS="$(DFLAGS)"

clean:
	-rm rpgle $(OFILES)
