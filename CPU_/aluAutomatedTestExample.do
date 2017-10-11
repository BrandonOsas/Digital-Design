restart -force -nowave

#entity fullALU is
#  
#  generic (
#    n : natural := 8);                  -- n-bit wide adder
#
#  port (
#   AC       : in std_logic_vector((n-1) downto 0);
#    dataBus  : in std_logic_vector((n-1) downto 0);
#    aluSelect: in std_logic_vector (7 downto 1);
#    dataOut  : out std_logic_vector ((n-1) downto 0));              
#
#end entity fullALU;

add wave  -color green    -logic   AC      
add wave  -color green    -logic   dataBus
add wave  -color green    -logic   aluSelect
add wave  -color orange   -logic   dataOut 


#prepare a file we can write the simulation results to

set filename "ALUVerification.txt"
set fp [open $filename "w"]


#stimulus
configure wave -timelineunits ns


#start with some default values
force -freeze AC        "00000000" 0ns
force -freeze dataBus   "00000000" 0ns
force -freeze aluSelect "0000000" 0ns


#a few defines for the ALUModes
#add more modes here
set ALU_ADD_MODE 0000011

set errorCount 0

# give the simulator a bit of space
run 20ns 

#start with the add testing

force -freeze aluSelect $ALU_ADD_MODE
#do a large amount of iterations, 12 for demo only
for {set i 0} {$i < 12} {incr i} {

	#set the data for the AC input according to variabl i
	force -freeze AC 10#[expr $i]

	#for the bus input generate a random number
	set busValue [expr round(127*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze dataBus 10#[expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i + $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /dataOut]


	echo  "Test: [expr $i] + [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]"
	puts $fp "Test: \t[expr $i] + [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] : Simulated Result= [expr $simulatedResult]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult} {
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		break
	}
	
}


echo "Simulation finished! Error count= [expr $errorCount]."
puts $fp  "Simulation finished! Error count= [expr $errorCount]."
set simulationPath pwd
echo "Simulation Results availabe at:  [pwd]/$filename " 
 
close $fp






