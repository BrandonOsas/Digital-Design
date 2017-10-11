add wave  -color green    -logic   inBus
add wave  -color blue     -logic   enable 
add wave  -color orange   -logic   outBus

force inBus 1000000000000001

run 50

force enable 1

run 500