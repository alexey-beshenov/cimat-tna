all: pics tna.pdf

pics:
	cd pic && $(MAKE)

tna.pdf:
	xelatex tna
	bibtex tna
	xelatex tna
	xelatex tna

clean:
	rm -f *.aux *.log *.bbl *.blg *.pdf
	cd pic && $(MAKE) clean
