QUOTE_FILES:=$(wildcard quotes/*)

all: deb

build bin/fortune-cif.deb: $(QUOTE_FILES)
	docker build -t fortune-cif .
	@mkdir -p bin
	docker run --rm -it -v $(shell pwd)/bin:/mnt fortune-cif cp fortune-cif.deb /mnt
.PHONY: build

run:
	docker run --rm -it fortune-cif /bin/bash
.PHONY: run

deb: bin/fortune-cif.deb

install: bin/fortune-cif.deb
	dpkg -i bin/fortune-cif.deb
.PHONY: install

clean:
	rm -rf bin
.PHONY: clean

