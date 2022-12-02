#!/bin/bash

N=32
(
cd ./templarian-png || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
   qmk painter-convert-graphics -f mono2 -i $file -o ../templarian-qgf &
done
)