#!/usr/bin/env bash

if !([ -f .version ]); then
    echo "v0.0.0" > .version
fi
version=`cat .version | sed -e "s/v//"`
major=$(echo $version | cut -d\. -f1);
minor=$(echo $version | cut -d\. -f2);
build=$(echo $version | cut -d\. -f3);
if [ "$1" = "major" ]; then 
    major=$(printf "%d" $(($major + 1))) ;
    minor=0 ;
    build=0 ;
fi
if [ "$1" = "minor" ]; then 
    minor=$(printf "%d" $(($minor + 1))) ;
    build=0 ;
fi
if [ "$1" = "build" ]; then 
    echo "building $build"
    build=$(printf "%d" $(($build + 1))) ;
fi
version=$(printf "v%d.%d.%d" $major $minor $build) ;
echo "$version" > .version
echo `cat .version`
