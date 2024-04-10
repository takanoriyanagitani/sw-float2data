#!/bin/sh

swift-format \
	format \
	--in-place \
	--ignore-unparsable-files \
	--parallel \
	--color-diagnostics \
    --recursive \
    ./Benchmarks \
    Package.swift
