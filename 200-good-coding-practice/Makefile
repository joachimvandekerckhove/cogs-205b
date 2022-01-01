all: 200-good-coding-practice.htm 201-homework-2.pdf

%.htm: %.md
	pandoc -t dzslides -s $< -o $@

%.pdf: %.md
	pandoc -s $< -o $@

clean:
	rm *.htm *.pdf
