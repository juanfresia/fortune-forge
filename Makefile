QUOTE_FILES:=$(wildcard quotes/*)

all: deb

build bin/fortune-forge.deb: $(QUOTE_FILES)
	docker build -t fortune-forge .
	@mkdir -p bin
	docker run --rm -it -v $(shell pwd)/bin:/mnt fortune-forge cp fortune-forge.deb /mnt
.PHONY: build

run:
	docker run --rm -it fortune-forge /bin/bash
.PHONY: run

deb: bin/fortune-forge.deb

install: bin/fortune-forge.deb
	dpkg -i bin/fortune-forge.deb
.PHONY: install

clean:
	rm -rf bin
.PHONY: clean

