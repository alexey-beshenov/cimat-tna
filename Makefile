all: pics tareas tna.pdf

pics:
	cd pic && $(MAKE)

hw:
	cd tareas && $(MAKE)

tna.pdf:
	xelatex tna
	bibtex tna
	xelatex tna
	xelatex tna

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.pdf
	cd pic && $(MAKE) clean
	cd tareas && $(MAKE) clean
