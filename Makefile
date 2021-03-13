build-pdf:
	latexmk main.tex

clean:
	find ./build/ -type f -not -name '*.pdf' -exec rm {} +

arxiv: build-pdf
	mkdir arxiv-build;
	cp -r main.tex mathpreamble.sty references.bib build/main.bbl images/ arxiv-build/;
	tar -czf arxiv-submission.tar.gz -C arxiv-build .;
	rm -rf arxiv-build
