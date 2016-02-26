CC=gcc
CFLAGS=-W -Wall -ansi -pedantic
LDFLAGS=
EXEC=shg
VPATH= src/ header/
BUILDDIR= obj
SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)


all: $(EXEC)

shg: main.o
	$(CC) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: 
	rm -rf *.o
	
mrproper: clean
	rm -rf 