#!/bin/bash
for f in $@
do
  if [ ! -f "../$f" ]
  then
    convert "$f" -resize '170x100!' "../$f"
    echo "CONVERTED:  $f"
  else
    echo "skipped:    $f"
  fi
done

