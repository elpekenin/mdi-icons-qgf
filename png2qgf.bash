#!/bin/bash

# From <https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop>

# BEWARE, might crash your computer
N=32
(
cd ./google-png || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
   qmk painter-convert-graphics -f mono2 -i $file -o ../google-qgf &
done
)

(
cd ./templarian-png || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
   qmk painter-convert-graphics -f mono2 -i $file -o ../templarian-qgf &
done
)