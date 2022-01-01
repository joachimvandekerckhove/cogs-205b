all: html/integration_intro.html html/quadrature_intro.html html/monteCarlo_intro.html html/integration_exercises.html

html/%.html: %.m
	matlab -batch "rng(0); publish('$<');"

clean:
	rm html/ -fr
