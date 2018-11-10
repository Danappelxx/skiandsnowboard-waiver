.DEFAULT_GOAL := waiver
DOCUMENTS_DIR = documents

PDFLATEX_JOBNAME = $(shell date +"%Y-%m-%d_waiver")
BASE_TEMPLATE = ./docusign_templates/2018-11-10.json


.PHONY: waiver
waiver:
	pdflatex -jobname=$(PDFLATEX_JOBNAME) -output-directory=$(DOCUMENTS_DIR) waiver.tex
	./generate_docusign_template.py $(BASE_TEMPLATE) "$(DOCUMENTS_DIR)/$(PDFLATEX_JOBNAME).pdf"

.PHONY: clean
clean:
	rm -f $(DOCUMENTS_DIR)/*.{aux,log,out}
