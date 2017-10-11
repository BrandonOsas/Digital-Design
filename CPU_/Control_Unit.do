add wave  -color green    -logic   IR
add wave  -color red      -logic   Zin
add wave  -color green    -logic   clock 
add wave  -color yellow   -logic   reset 
add wave  -color orange   -logic   CU_out

force IR 00000010

force Zin 1

force clock 0 0 , 1 25 -repeat 50

force reset 1

run 20

force reset 0

run 500