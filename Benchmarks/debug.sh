#!/bin/sh

numcpus=23
jobs=$(( ${numcpus} - 1 ))

swift \
    build \
    --jobs ${jobs}
