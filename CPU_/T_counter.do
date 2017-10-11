add wave  -color green    -logic   clk 
add wave  -color blue     -logic   reset 
add wave  -color orange   -logic   TC_out 

force clk 0 0 , 1 25 -repeat 50

force reset 0

run 20

force reset 1

force reset 1
run 20
force reset 0
run 500