add wave  -color green    -logic   inBus
add wave  -color blue     -logic   enable 
add wave  -color orange   -logic   outBus

force inBus 10000001
force enable 0
run 200

force enable 1
run 100