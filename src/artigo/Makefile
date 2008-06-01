
SOURCEDOCUMENT=TCCufla
DVIVIEWER=xdvi
PSVIEWER=gv
PDFVIEWER=evince

CAPITULOS=$(wildcard *.tex)

#######################################
.SUFFIXES: .dia .eps

.dia.eps:
	dia --nosplash --export=$@ $<

all: $(SOURCEDOCUMENT).dvi

view: $(SOURCEDOCUMENT).dvi
	$(DVIVIEWER) $<

quiet: $(SOURCEDOCUMENT).dvi

psview: $(SOURCEDOCUMENT).ps
	$(PSVIEWER) $(SOURCEDOCUMENT).ps

pdfview: $(SOURCEDOCUMENT).pdf
	$(PDFVIEWER) $(SOURCEDOCUMENT).pdf

#tgz:
#	tar cvzf $(SOURCEDOCUMENT).tar.gz Makefile browser.eps sbc2003.sty source.eps tplusplus.dia tpp.bib tpp.tex

$(SOURCEDOCUMENT).ps: $(SOURCEDOCUMENT).dvi
	dvips $<

$(SOURCEDOCUMENT).pdf: $(SOURCEDOCUMENT).dvi
	dvipdf $<

# comentar a partir de $(GRAPHICSFROMDIA) de não usar nenhuma figura do dia. Assim:
$(SOURCEDOCUMENT).dvi: $(SOURCEDOCUMENT).tex $(SOURCEDOCUMENT).bib #$(GRAPHICSFROMDIA)

$(SOURCEDOCUMENT).dvi: $(SOURCEDOCUMENT).tex $(CAPITULOS) $(SOURCEDOCUMENT).bib $(GRAPHICSFROMDIA)
	latex $< && bibtex $(SOURCEDOCUMENT) && latex $< && latex $< || $(RM) $@

clean:
	$(RM) *.aux *.backup *.bbl *.blg *.lof *.lot *.log *.ps *.pdf *.dvi $(GRAPHICSFROMDIA) *~ *.toc
