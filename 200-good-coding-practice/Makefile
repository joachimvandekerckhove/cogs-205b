all: \
	200-good-coding-practice.pdf \
	201-homework-2.pdf \
	210-good-coding-practice-part-ii.pdf \
	210-good-coding-practice-part-ii.htm

%.htm: %.md styles
	pandoc -t dzslides -s $< -o $@ --slide-level 3 -H styles

%.pdf: %.md
	pandoc -s $< -o $@

%.html: %.md
	pandoc -s $< -o $@

clean:
	rm *.htm *.pdf *.html
