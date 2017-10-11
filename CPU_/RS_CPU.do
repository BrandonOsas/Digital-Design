########################################################################
# Simulation file to test the RS_CPU one instruction at a time.
# Note that you will have to take care of the number of clock cycles
# and ensure that there are exactly the right number for each fetch-
# execute cycle.
#
# Always include the restart command or your wave window will fill with
# multiple wave instances
#
########################################################################
# reset the simulation
restart -force -nowave
########################################################################
# Add the reset and the clock; You will need to adapt the names to match
# your design.
########################################################################
add wave -color blue -logic clock
add wave -color red -logic reset
# Add the inputs and outputs to the CPU
add wave -color blue -logic dataBus1
add wave -color red -logic dataBus2
add wave -color red -logic Address
# monitor some internal signals

########################################################################
# start the simulation
# start the clock and drive the reset making sure it is the right way up.
# system will go into fetch1 during reset so first rising edge after
# reset will go to fetch 2
########################################################################
force clock 0 0 , 1 25 -repeat 50
force reset 0 0 , 1 650us
#
# place NOP on bus
force dataBus1 10010110
#
# place LDAC on data_bus
force RS_CPU/Bus2 16#01# 1600us
#
# place data address low byte on bus
force dataBus1 10010110
#
# place address high byte
force dataBus2 11010010
run 500