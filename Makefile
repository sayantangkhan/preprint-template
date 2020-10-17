build-pdf:
	latexmk main.tex

clean:
	find ./build/ -type f -not -name '*.pdf' -exec rm {} +

arxiv: build-pdf
	mkdir arxiv-build;
	cp main.tex mathpreamble.sty references.bib build/main.bbl arxiv-build/;
	find . -maxdepth 1 -type f -name '*.pdf' -exec cp '{}' arxiv-build \;
	find . -maxdepth 1 -type f -name '*.pdf_tex' -exec cp '{}' arxiv-build \;
	tar -czf arxiv-submission.tar.gz -C arxiv-build .;
	rm -rf arxiv-build
