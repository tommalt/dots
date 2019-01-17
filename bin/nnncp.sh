#!/bin/sh

IFS=
echo -n $1 | xsel --clipboard --input
