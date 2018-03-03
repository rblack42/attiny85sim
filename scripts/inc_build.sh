#!/usr/bin/env bash

if !([ -f .build ]); then
    echo "build=0" > .build
fi
build=`cat .build | sed -e "s/build=//"`
if [ "$1" = "reset" ]; then
    build=0
fi
build=$(printf "%d" $(($build + 1))) ;
echo "build=$build" > .build
echo `cat .build`
