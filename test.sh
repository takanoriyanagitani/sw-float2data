#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

swift \
	test \
	--quiet \
	--parallel \
	--jobs ${jobs} ||
	echo NG
