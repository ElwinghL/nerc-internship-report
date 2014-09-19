LATEX=pdflatex
LATEXMK=latexmk
LATEXOPT=-shell-escape

MAIN=main
SOURCES=$(MAIN).tex Makefile preamble.tex sections/* appendices/*
FIGURES := $(shell ls figures/* images/*)

all:	$(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) -pdf -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN).tex

force:
	touch .refresh
	$(MAKE) $(MAIN).pdf

.PHONY: clean force all

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk
