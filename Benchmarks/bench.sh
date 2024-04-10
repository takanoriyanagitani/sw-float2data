#!/bin/sh

numcpus=23
jobs=$(( ${numcpus} - 1 ))

swift \
    package \
    --jobs ${jobs} \
    benchmark
