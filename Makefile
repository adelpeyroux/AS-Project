CC=gcc
CFLAGS=-W -Wall -ansi -pedantic -std=c11
LDFLAGS=-lm -lfl
EXEC=shg
VPATH= src/ header/ generated/
BUILDDIR= obj
SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)


all: $(EXEC)

generated/parser.tab.c generated/parser.tab.h: parser/parser.y
	bison -d -v parser/parser.y
	mv parser.output parser.tab.c parser.tab.h generated/

generated/lex.yy.c: parser/parser.l parser.tab.h
	flex parser/parser.l
	mv lex.yy.c generated/

shg: generated/parser.tab.h generated/parser.tab.c generated/lex.yy.c $(BUILDDIR)/main.o $(BUILDDIR)/tree.o
	$(CC) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: 
	rm -rf $(BUILDDIR)/*.o
	
mrproper: clean
	rm -rf generated/lex.yy.c
	rm -rf generated/parser.output
	rm -rf generated/parser.tab.c
	rm -rf generated/parser.tab.h
	rm -rf $(EXEC)