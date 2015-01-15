#!/bin/bash
for target in ~/.environment/_*; do
    if [ -f $target ]; then
        ln -sfnv $target ".${target##*/_}"
    fi
done
