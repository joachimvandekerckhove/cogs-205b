all: metropolis-hastings.pdf html/metropolis_intro.html

html/%.html: %.m
	matlab -batch "rng(0); publish('$<');"

%.pdf: %.tex
	pdflatex $< > /dev/null

clean:
	rm *.pdf html/ -fr
