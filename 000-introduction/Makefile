all: 000-introduction.htm

%.htm: %.md
	pandoc -t dzslides -s $< -o $@

clean:
	rm *.htm
