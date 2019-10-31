FROM ubuntu:18.04

RUN apt update && apt install -y fortune-mod

RUN mkdir /fortune-cif
COPY . /fortune-cif

WORKDIR /fortune-cif
RUN scripts/generate.sh

