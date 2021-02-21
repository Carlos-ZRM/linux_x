#!/bin/bash
busquedas=("*.txt" "*.png" "*.html" "*css" "*jpg" )

for i in {0..4}
do
  echo maxdepth $i 
  for b in ${busquedas[@]}
  do
    start=`date +%s`;
    find media/ -maxdepth $i -name $b 1>/dev/null 2>&1 ;
    end=`date +%s`
    echo "  $b  $(($end-$start))"
  done
done
