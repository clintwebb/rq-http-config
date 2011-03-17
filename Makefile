## make file for rq-http-config.

all: rq-http-config

DEBUG_LIBS=
# DEBUG_LIBS=-lefence -lpthread


ARGS=-Wall -O2 -g
LIBS=-lrq-service -lrispbuf -lrisp -levent_core -lexpbuf -lrq -llinklist -lrq-http-config -lsqlite3 $(DEBUG_LIBS)
OBJS=event-compat.o rq-http-config.o
DESTDIR=



rq-http-config: $(OBJS)
	gcc -o $@ $(OBJS) $(LIBS) $(ARGS)


rq-http-config.o: rq-http-config.c event-compat.h
	gcc -c -o $@ rq-http-config.c $(ARGS)


event-compat.o: event-compat.c event-compat.h
	gcc -c -o $@ event-compat.c $(ARGS)


install: rq-http-config
	@cp rq-http-config $(DESTDIR)/usr/bin

clean:
	@-rm rq-http-config
	@-rm $(OBJS)
