all: 000-introduction.htm

%.htm: %.md
	pandoc -t dzslides -s $< -o $@

%.pdf: %.md
	pandoc -t beamer -s $< -o $@

clean:
	rm *.htm *.pdf
