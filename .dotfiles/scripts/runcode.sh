#!/bin/bash

function runbinary {
    NAME=${1%.*}
    nasm -felf64 ${NAME}.asm -o bin/${NAME}.o && ld bin/${NAME}.o -o bin/${NAME}.out && bin/${NAME}.out
    unset NAME
}

function runbf {
    NAME=${1%.*}
    bfc ${NAME}.bf&& ./a.out
    unset NAME
}

function runccpp {
    SRC=$1
    mkdir -p build
    OUT=build/"${SRC%.*}".out
    gcc -Wall -Wextra -O0 -g $SRC -o $OUT&& $OUT
    unset SRC
    unset OUT
}

if [ -z $2 ]; then
    LANG=${1#*.}
    echo "Detected Language: $LANG"
else
    LANG=$2
fi


case $LANG in
    c) runccpp $1;;
    asm) runbinary $1;;
    bf) runbf $1;;
    py) python $1;;
    *) echo "Unsupported source type";;
esac
