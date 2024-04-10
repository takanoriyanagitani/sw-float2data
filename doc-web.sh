#!/bin/sh

docdir=./doc.d
port=4108

python3 \
	-m http.server \
	--bind 127.0.0.1 \
	--directory "${docdir}" \
	${port}
