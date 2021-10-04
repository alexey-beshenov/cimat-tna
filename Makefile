define bibrun
    xelatex $(1); bibtex $(1); xelatex $(1); xelatex $(1)
endef

all: pic tna.pdf diapositivas tareas

diapositivas:
	$(MAKE) -C diapositivas

pic:
	$(MAKE) -C pic

tareas:
	$(MAKE) -C tareas

tna.pdf: $(wildcard *.tex)
	$(call bibrun,tna)

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.pdf
	$(MAKE) -C diapositivas clean
	$(MAKE) -C pic clean
	$(MAKE) -C tareas clean

.PHONY: clean diapositivas pic tareas
