all: 100-matlab-code-organization.htm 101-Norm2d.pdf

%.htm: %.md
	pandoc -t dzslides -s $< -o $@

%.pdf: %.md
	pandoc -s $< -o $@

clean:
	rm *.htm *.pdf
