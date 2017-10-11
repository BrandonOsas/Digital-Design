add wave  -color green    -logic   clock 
add wave  -color blue     -logic   enable 
add wave  -color red      -logic   inBus 
add wave  -color yellow   -logic   reset 
add wave  -color orange   -logic   output 

force clock 0 0 , 1 25 -repeat 50
force inBus 1
force reset 0
force enable 1
run 300

force reset 1

run 100