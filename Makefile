CFLAGS	= -O -Wall -Werror -Wno-unused-function
DFLAGS	= -g -Wall -Werror -Wno-unused-function -DRPGLE_DEBUG
YFLAGS	= -d

OFILES	= rpgle.o rpgle.g.o rpgle.lx.o

rpgle:	rpgle.h y.tab.h $(OFILES)
	$(CC) $(CFLAGS) -o rpgle $(OFILES) -lfl -ly

rpgle.g.o:	rpgle.h rpgle.g.y
rpgle.lx.o:	rpgle.h y.tab.h rpgle.lx.l

y.tab.h:	rpgle.g.o

rpgle.o:	rpgle.c

debug:	clean
	$(MAKE) CFLAGS="$(DFLAGS)"

clean:
	-rm rpgle $(OFILES) y.tab.h
