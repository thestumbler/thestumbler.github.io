#!/bin/bash
for f in $@
do
  if [ ! -f "../$f" ]
  then
    convert "$f" -auto-orient -resize "800x800>" "../$f"
    echo "CONVERTED:  $f"
  else
    echo "skipped:    $f"
  fi
done

