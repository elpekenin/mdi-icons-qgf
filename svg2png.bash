#!/bin/bash

# From <https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop>

# Number of concurrent tasks. Beware, a big one could crash your computer
N=32
(
cd ./templarian-svg || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
#                                                    ↓ this is the output image's size
   svgexport $file ../templarian-png/${file/svg/png} 48: "svg{fill: white;}" &
#                                                                    ↑ need to make the SVG white so it works
done 
)