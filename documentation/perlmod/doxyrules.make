DOXY_EXEC_PATH = /Users/michshep/Desktop/eecs498/TZ_ADO/src
DOXYFILE = /Users/michshep/Desktop/eecs498/TZ_ADO/src/dconfig
DOXYDOCS_PM = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/DoxyDocs.pm
DOXYSTRUCTURE_PM = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/DoxyStructure.pm
DOXYRULES = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxyrules.make
DOXYLATEX_PL = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxylatex.pl
DOXYLATEXSTRUCTURE_PL = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxylatex-structure.pl
DOXYSTRUCTURE_TEX = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxystructure.tex
DOXYDOCS_TEX = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxydocs.tex
DOXYFORMAT_TEX = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxyformat.tex
DOXYLATEX_TEX = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxylatex.tex
DOXYLATEX_DVI = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxylatex.dvi
DOXYLATEX_PDF = /Users/michshep/Desktop/eecs498/TZ_ADO/src/../documentation/perlmod/doxylatex.pdf

.PHONY: clean-perlmod
clean-perlmod::
	rm -f $(DOXYSTRUCTURE_PM) \
	$(DOXYDOCS_PM) \
	$(DOXYLATEX_PL) \
	$(DOXYLATEXSTRUCTURE_PL) \
	$(DOXYDOCS_TEX) \
	$(DOXYSTRUCTURE_TEX) \
	$(DOXYFORMAT_TEX) \
	$(DOXYLATEX_TEX) \
	$(DOXYLATEX_PDF) \
	$(DOXYLATEX_DVI) \
	$(addprefix $(DOXYLATEX_TEX:tex=),out aux log)

$(DOXYRULES) \
$(DOXYMAKEFILE) \
$(DOXYSTRUCTURE_PM) \
$(DOXYDOCS_PM) \
$(DOXYLATEX_PL) \
$(DOXYLATEXSTRUCTURE_PL) \
$(DOXYFORMAT_TEX) \
$(DOXYLATEX_TEX): \
	$(DOXYFILE)
	cd $(DOXY_EXEC_PATH) ; doxygen "$<"

$(DOXYDOCS_TEX): \
$(DOXYLATEX_PL) \
$(DOXYDOCS_PM)
	perl -I"$(<D)" "$<" >"$@"

$(DOXYSTRUCTURE_TEX): \
$(DOXYLATEXSTRUCTURE_PL) \
$(DOXYSTRUCTURE_PM)
	perl -I"$(<D)" "$<" >"$@"

$(DOXYLATEX_PDF) \
$(DOXYLATEX_DVI): \
$(DOXYLATEX_TEX) \
$(DOXYFORMAT_TEX) \
$(DOXYSTRUCTURE_TEX) \
$(DOXYDOCS_TEX)

$(DOXYLATEX_PDF): \
$(DOXYLATEX_TEX)
	pdflatex -interaction=nonstopmode "$<"

$(DOXYLATEX_DVI): \
$(DOXYLATEX_TEX)
	latex -interaction=nonstopmode "$<"
