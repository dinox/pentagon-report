DOCUMENT=report

FILES=*.tex 

all: $(DOCUMENT).pdf

$(DOCUMENT).pdf: $(FILES)
	#if [ -d img ]; then make -C img; fi
	rm -f pdflatex.out
	latex $(DOCUMENT).tex 2>&1 | tee pdflatex.out
	if grep -q '\\cite{' *.tex; then bibtex $(DOCUMENT); fi;
	latex $(DOCUMENT).tex 2>&1 | tee pdflatex.out
	latex $(DOCUMENT).tex 2>&1 | tee pdflatex.out
	dvips $(DOCUMENT).dvi -o $(DOCUMENT).ps
	ps2pdf14 -dPDFSETTINGS=/prepress -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode $(DOCUMENT).ps
	cp $(DOCUMENT).pdf compiled_pdf/

show: $(DOCUMENT).pdf
	evince $(DOCUMENT).pdf

force: 
	rm -f $(DOCUMENT).pdf
	make $(DOCUMENT).pdf

clean:
	rm -f *.aux *.out $(DOCUMENT).bbl *.bst *.log
	rm -f $(DOCUMENT).blg $(DOCUMENT).dvi $(DOCUMENT).vrb
	rm -f $(DOCUMENT).pdf $(DOCUMENT).toc $(DOCUMENT).lo[a,f,g,h,l,t]
	rm -f $(DOCUMENT).nav $(DOCUMENT).snm $(DOCUMENT).ps
	rm -f history.txt llncs.cls llncs.dem llncs.ind llncsdoc.sty sprmindx.sty subjidx.ind llncs.dvi llncs.doc llncsdoc.pdf splncs03.bst readme.txt
	#if [ -f plt/Makefile ]; then make -C plt clean; fi
	#if [ -d img ]; then make -C img clean; fi
	#if [ -d slides ]; then make -C img clean; fi
	#if [ -d ../img ]; then make -C ../img clean; fi
	svn status


