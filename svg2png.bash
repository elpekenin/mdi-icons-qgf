#!/bin/bash

# From <https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop>

N=16
(
cd ./templarian-svg || exit
for file in ./*; do 
   ((i=i%N)); ((i++==0)) && wait
   svgexport $file ../templarian-png/${file/svg/png} 48: "svg{fill: white;}"&
done
)