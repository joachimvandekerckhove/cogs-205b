all: subdirs README.md

SUBDIRS = \
    000-introduction \
    100-matlab-code-organization \
    200-good-coding-practice \
    300-optimization \
    400-integration \
    500-metropolis

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ all

README.md: syllabus.md
	cp syllabus.md README.md

clean:
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir clean; \
	done
