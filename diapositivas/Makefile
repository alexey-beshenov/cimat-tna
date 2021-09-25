all: pic pari-1.pdf pari-2.pdf valores-especiales.pdf valores-especiales-handout.pdf

pari-1.pdf: pari-1.tex
	xelatex pari-1
	xelatex pari-1

pari-2.pdf: pari-2.tex
	xelatex pari-2
	xelatex pari-2

valores-especiales.pdf: valores-especiales.tex
	xelatex valores-especiales
	xelatex valores-especiales

valores-especiales-handout.pdf: valores-especiales.tex
	xelatex -jobname=valores-especiales-handout '\let\handout=1 \input' valores-especiales
	xelatex -jobname=valores-especiales-handout '\let\handout=1 \input' valores-especiales

pic:
	$(MAKE) -C ../pic

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *.vrb

.PHONY: clean pic
