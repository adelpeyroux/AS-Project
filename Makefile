CC=gcc
CFLAGS=-W -Wall -ansi -pedantic -std=c11
LDFLAGS=-lm -lfl
EXEC=shg
VPATH= src/ header/ $(GENDIR)/ parser/
BUILDDIR= obj
GENDIR= generated
SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)


all: $(EXEC)

$(GENDIR)/%.tab.h $(GENDIR)/%.dot $(GENDIR)/%.tab.c:  %.y
	bison -d -g -v $<
	mv $*.* $(GENDIR)/

$(GENDIR)/%.yy.c: %.l %.tab.h
	flex -o $@ $< 

$(EXEC): $(GENDIR)/parser.tab.h $(GENDIR)/parser.tab.c $(GENDIR)/parser.yy.c $(BUILDDIR)/main.o $(BUILDDIR)/tree.o
	$(CC) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: 
	rm -rf $(BUILDDIR)/*.o
	
mrproper: clean
	rm -rf $(GENDIR)/*
	touch $(GENDIR)/README.md
	rm -rf $(EXEC)