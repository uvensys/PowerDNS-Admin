#Dockerfile vars
alpver=3.13

#vars
IMAGENAME=powerdns-admin
REPO=harbor.uvensys.systems/uvensys
SOURCE_VERSION=0.2.3
IMAGEFULLNAME=${REPO}/${IMAGENAME}:${SOURCE_VERSION}

.PHONY: help build push all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo "alpver - Alpine Version"
	    @echo ""
	    @echo "Makefile commands:"
	    @echo "build"
	    @echo "push"
	    @echo "all"

.DEFAULT_GOAL := all

build:
	    @cp yarn.lock requirements.txt docker
	    @docker build --pull --build-arg ALP_VER=${alpver} -t ${IMAGEFULLNAME} -f docker/Dockerfile .

push:
	    @docker push ${IMAGEFULLNAME}

all: build push

