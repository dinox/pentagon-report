DOCUMENT=report

FILES=*.tex 

all: $(DOCUMENT).pdf

$(DOCUMENT).pdf: $(FILES)
	pdflatex $(DOCUMENT).tex
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT).tex
	pdflatex $(DOCUMENT).tex

show: $(DOCUMENT).pdf
	open $(DOCUMENT).pdf

force: 
	rm -f $(DOCUMENT).pdf
	make $(DOCUMENT).pdf

clean:
	rm -f *.aux *.out $(DOCUMENT).bbl *.log
	rm -f $(DOCUMENT).blg $(DOCUMENT).dvi $(DOCUMENT).vrb
	rm -f $(DOCUMENT).pdf $(DOCUMENT).toc $(DOCUMENT).lo[a,f,g,h,l,t]
	rm -f $(DOCUMENT).nav $(DOCUMENT).snm $(DOCUMENT).ps
	rm -f history.txt llncs.cls llncs.dem llncs.ind llncsdoc.sty sprmindx.sty subjidx.ind llncs.dvi llncs.doc llncsdoc.pdf splncs03.bst readme.txt
	svn status


