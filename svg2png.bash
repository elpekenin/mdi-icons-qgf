#!/bin/bash

INPUT_PATH=./templarian-svg
OUTPUT_PATH=../templarian-png # relative to input path
IMG_SIZE=48

# From <https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop>

# Number of concurrent tasks. Beware, a big one could crash your computer
N=32
(
cd $INPUT_PATH || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
#                                     ↓ same name as with png extension his is the output image's size
   svgexport $file $OUTPUT_PATH/${file/.svg/.png} $IMG_SIZE: "svg{fill: white;}" &
#                                                                    ↑ need to make the SVG white so it works
done 
)