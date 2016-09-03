REF = HEAD
VERSION = $(shell git describe --always $(REF))

ARCHIVE = vim-cheat-engine-$(VERSION).zip
ARCHIVE_DIRS = after autoload compiler doc ftdetect ftplugin indent syntax

# Don't do anything by default.
all:

# Make vim.org zipball.
archive:
	git archive $(REF) -o $(ARCHIVE) -- $(ARCHIVE_DIRS)

# Remove zipball.
clean:
	-rm -f $(ARCHIVE)

# Build the list of syntaxes for @ceAll.
ceAll:
	@grep -E 'syn (match|region)' syntax/ce.vim |\
	 grep -v 'contained' |\
	 awk '{print $$3}' |\
	 uniq

.PHONY: all archive clean hash ceAll
