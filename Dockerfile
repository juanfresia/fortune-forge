FROM ubuntu:18.04

RUN apt update && apt install -y fortune-mod

RUN mkdir /fortune-forge
COPY . /fortune-forge

WORKDIR /fortune-forge
RUN scripts/generate.sh

