#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

find \
	./Sources \
	./Tests \
	./Package.swift \
	-type f \
	-name '*.swift' |
	xargs \
		swiftc \
		-j ${jobs} \
		-typecheck
