all: metropolis-hastings.pdf html/metropolis_intro.html assignment.pdf

html/%.html: %.m
	matlab -batch "rng(0); publish('$<');"

%.pdf: %.tex
	pdflatex $< > /dev/null

%.pdf: %.md
	pandoc -V geometry:margin=1in -s $< -o $@
	
clean:
	rm *.pdf html/ -fr
