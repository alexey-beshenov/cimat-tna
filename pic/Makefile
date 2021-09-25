TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(TEX_FILES:.tex=.pdf)

all: $(PDF_FILES)

%.pdf: %.tex
	xelatex $<

clean:
	rm -f *.aux *.log *.pdf

.PHONY: clean
