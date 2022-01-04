all: 000-introduction.htm styles

%.htm: %.md
	pandoc -t dzslides -s $< -o $@ --slide-level 3 -H styles

%.pdf: %.md
	pandoc -t beamer -s $< -o $@

clean:
	rm *.htm *.pdf
