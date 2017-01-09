#
# Makefile for Proxy Lab 
#
# You may modify is file any way you like (except for the handin
# rule). Autolab will execute the command "make" on your specific 
# Makefile to build your proxy from sources.
#
CC = gcc
CFLAGS = -g -Wall -Werror
LDFLAGS = -lpthread

all: proxy

cache.o: cache.c cache.h
	$(CC) $(CFLAGS) -c cache.c

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

hri.o: hri.c csapp.h hri.h
	$(CC) $(CFLAGS) -c hri.c

proxy.o: proxy.c csapp.h proxy.h defs.h hri.h res.h cache.h
	$(CC) $(CFLAGS) -c proxy.c

res.o: res.c csapp.h res.h
	$(CC) $(CFLAGS) -c res.c

proxy: cache.o csapp.o hri.o proxy.o res.o
	$(CC) $(CFLAGS) cache.o csapp.o hri.o proxy.o res.o -o proxy $(LDFLAGS)
# Creates a tarball in ../proxylab-handin.tar that you should then
# hand in to Autolab. DO NOT MODIFY THIS!
handin:
	(make clean; cd ..; tar cvf proxylab-handin.tar proxylab-handout --exclude tiny --exclude nop-server.py --exclude proxy --exclude driver.sh --exclude port-for-user.pl --exclude free-port.sh --exclude ".*")

clean:
	rm -f *~ *.o proxy core *.tar *.zip *.gzip *.bzip *.gz

