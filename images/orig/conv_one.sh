#!/bin/bash
if [ ! -f ../$1 ]
then
  convert $1 -resize "800x800>" ../$1
  echo "CONVERTED:  $1"
else
  echo "skipped:    $1"
fi

