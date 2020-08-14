all: book

book:
	cd pic && $(MAKE)

	xelatex tna
	bibtex tna
	xelatex tna
	xelatex tna

clean:
	rm -f *.aux *.log *.bbl *.blg *.pdf
	cd pic && $(MAKE) clean
