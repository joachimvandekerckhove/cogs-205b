all: 100-matlab-code-organization.htm 101-Norm2d.pdf

%.htm: %.md styles
	pandoc -t dzslides -s $< -o $@ --slide-level 3 -H styles

%.pdf: %.md
	pandoc -s $< -o $@

clean:
	rm *.htm *.pdf
