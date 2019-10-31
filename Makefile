

build:
	sudo docker build -t fortune-cif .
	@mkdir -p bin
	sudo docker run --rm -it -v $(shell pwd)/bin:/mnt fortune-cif cp fortune-cif.deb /mnt
.PHONY: build

run:
	sudo docker run --rm -it fortune-cif /bin/bash
.PHONY: run
