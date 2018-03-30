ELISP=$(shell find . -type f -name '*.el')

TAGS: $(ELISP)
	@etags $(ELISP)
