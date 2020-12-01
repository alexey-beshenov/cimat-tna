beamer: pari-1.pdf pari-2.pdf valores-especiales.pdf valores-especiales-handout.pdf

pari-1.pdf:
	xelatex pari-1
	xelatex pari-1

pari-2.pdf:
	xelatex pari-2
	xelatex pari-2

valores-especiales.pdf:
	xelatex valores-especiales
	xelatex valores-especiales

valores-especiales-handout.pdf:
	xelatex -jobname=valores-especiales-handout '\let\handout=1 \input' valores-especiales
	xelatex -jobname=valores-especiales-handout '\let\handout=1 \input' valores-especiales

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *.vrb
