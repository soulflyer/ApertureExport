#!/bin/bash
# Used to delete extraneous files exported by a bug in the "modified" scpt
# eg delete-pic 2014/10/testproject IMG_001 IMG_002
# note the project is separate from the image and the image has no suffix
PICPATH=/Users/iain/Pictures/Published
PROJECT=$1
shift
while [ "$1" != "" ]
do
  FILE="$1.*"
      rm $PICPATH/fullsize/$PROJECT/$FILE
      rm $PICPATH/large/$PROJECT/$FILE
      rm $PICPATH/medium/$PROJECT/$FILE
      rm $PICPATH/thumbs/$PROJECT/$FILE
      rm $PICPATH/masters/$PROJECT/$FILE
  shift
done
build-shoot-page $PICPATH/$PROJECT
