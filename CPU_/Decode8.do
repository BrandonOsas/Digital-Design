add wave  -color green    -logic   TC_out
add wave  -color orange   -logic   opcode 

force TC_out 000
run 100

force TC_out 001
run 100

force TC_out 010
run 100

force TC_out 011
run 100

force TC_out 100
run 100

force TC_out 101
run 100

force TC_out 110
run 100

force TC_out 111
run 100
