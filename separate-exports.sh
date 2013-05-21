#!/bin/bash
# Expects a directory in the current directory called fullsize,
# containing year/month/project folders.

for pathname in `ls -d fullsize/*/*/*`
do
    proj=`basename $pathname`
    pathname=`dirname $pathname`
    mon=`basename $pathname`
    pathname=`dirname $pathname`
    yr=`basename $pathname`
    ymp="$yr/$mon/$proj"
echo "***************** $ymp"
    mkdir -p masters/$ymp
    mv fullsize/$ymp/masters/* masters/$ymp
    mkdir -p thumbs/$ymp
    mv fullsize/$ymp/thumbs/* thumbs/$ymp
    mkdir -p watermarked/$ymp
    mv fullsize/$ymp/watermarked/* watermarked/$ymp
done
rm -r fullsize/*/*/*/masters
rm -r fullsize/*/*/*/thumbs
rm -r fullsize/*/*/*/watermarked
