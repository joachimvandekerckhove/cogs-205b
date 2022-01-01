all: metropolis-hastings.pdf html/metropolis_intro.html

html/%.html: %.m
	matlab -batch "publish('$<');"

%.pdf: %.tex
	pdflatex $<

clean:
	rm *.pdf html/ -fr
