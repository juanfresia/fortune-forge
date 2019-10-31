
all: build

build:
	docker build -t fortune-cif .
	@mkdir -p bin
	docker run --rm -it -v $(shell pwd)/bin:/mnt fortune-cif cp fortune-cif.deb /mnt
.PHONY: build

run:
	docker run --rm -it fortune-cif /bin/bash
.PHONY: run

bin/fortune-cif.deb: build

install: bin/fortune-cif.deb
	dpkg -i bin/fortune-cif.deb

