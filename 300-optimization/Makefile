all: html/anonymousFunctions.html \
     html/nelderMead_intro.html   \
     html/newtonRaphson_intro.html\
     html/hillClimber_intro.html  \
     html/simulatedAnnealing_intro.html \
     html/optimizationExercises.html \
     html/310-optimization-diagnostics.htm

html/%.html: %.m
	matlab -batch "rng(0); publish('$<');"

html/%.htm: %.md styles
	pandoc -t dzslides -s $< -o $@ --slide-level 3 -H styles

clean:
	rm *.mat html/ -fr


