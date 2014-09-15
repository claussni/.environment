#!/bin/bash
for target in ~/.environment/.*; do
    if [ -f $target ]; then
        ln -sv $target "${target##*/}"
    fi
done
