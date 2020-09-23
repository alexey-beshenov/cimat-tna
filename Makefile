all: pics hw tna.pdf beamer

pics:
	cd pic && $(MAKE)

hw:
	cd tareas && $(MAKE)

tna.pdf:
	xelatex tna
	bibtex tna
	xelatex tna
	xelatex tna

beamer:
	cd pari-pres && $(MAKE)

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.pdf
	cd pic && $(MAKE) clean
	cd tareas && $(MAKE) clean
	cd pari-pres && $(MAKE) clean
