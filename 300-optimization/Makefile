all: html/anonymousFunctions.html html/nelderMead_intro.html html/newtonRaphson_intro.html html/hillClimber_intro.html html/simulatedAnnealing_intro.html html/optimizationExercises.html

html/%.html: %.m
	matlab -batch "rng(0); publish('$<');"

clean:
	rm *.mat html/ -fr


