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
	cd diapositivas && $(MAKE)

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.pdf
	cd pic && $(MAKE) clean
	cd tareas && $(MAKE) clean
	cd diapositivas && $(MAKE) clean
