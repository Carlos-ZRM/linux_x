#!/bin/bash
busquedas=("*.txt" "*.jpg" )
inicio=`date +%s`

sudo umount /home/carlos-zrm/media-copy
sudo umount /home/carlos-zrm/media-copy

sudo rm -r /home/carlos-zrm/cache-copy/*
sudo mount /home/carlos-zrm/media-copy
sudo cp -r /home/carlos-zrm/media-copy/* /home/carlos.zrm/fake-cache/ 2>/dev/null 

cd /home/carlos.zrm/media-copy/static/assets


for i in {0..2}
do
  echo time $i
  for b in ${busquedas[@]}
  do
    start=`date +%s`;
    
    grep -cor -m 2 $b 1>/dev/null 2>&1 ;
    
    end=`date +%s`
    echo "   $b $(($end-$start))"
  done
done

final=`date +%s`
echo "TIEMPO TOTAL $(($final-$inicio))"
