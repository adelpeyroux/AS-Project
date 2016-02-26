CC=gcc
CFLAGS=-W -Wall -ansi -pedantic
LDFLAGS=-lm -lfl
EXEC=shg
VPATH= src/ header/ generated/
BUILDDIR= obj
SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)


all: $(EXEC)

generated/calc.tab.c generated/calc.tab.h: parser/calc.y
	bison -d -v parser/calc.y
	mv calc.output calc.tab.c calc.tab.h generated/

generated/lex.yy.c: parser/calc.l calc.tab.h
	flex parser/calc.l
	mv lex.yy.c generated/

shg: generated/calc.tab.h generated/calc.tab.c generated/lex.yy.c $(BUILDDIR)/main.o $(BUILDDIR)/variables.o
	$(CC) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: 
	rm -rf $(BUILDDIR)/*.o
	
mrproper: clean
	rm -rf generated/*
	rm -rf $(EXEC)