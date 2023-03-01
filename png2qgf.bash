#!/bin/bash

INPUT_PATH=./templarian-png
OUTPUT_PATH=../templarian-qgf # relative to input path
TARGET_FMT=mono2

# From <https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop>

# Number of concurrent tasks. Beware, a big one could crash your computer
N=32
(
cd $INPUT_PATH || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
   qmk painter-convert-graphics -f $TARGET_FMT -i $file -o $OUTPUT_PATH &
done
)