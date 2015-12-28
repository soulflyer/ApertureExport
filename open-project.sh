#!/bin/bash
if [ ! -f "/tmp/missing.txt" ]
then
    check-images -s /Users/iain/Pictures/Published/large > /tmp/missing.txt
fi
nth=1

if [ $1 ]
then
   nth=$1
fi
open-project $(tail -r /tmp/missing.txt | sed -e"$nth"p -n)
