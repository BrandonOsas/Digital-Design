library ieee;
use ieee.std_logic_1164.all;
entity fulladder is
port(
A,B,Ci: in std_logic; -- inputs A,B,C,D
S,Co: out std_logic); --outputs S,Co
 
end entity;
ARCHITECTURE dataflow OF fulladder IS 
BEGIN

	S   <= A XOR B XOR Ci;
	Co  <= (A AND B) OR (A AND Ci) OR (B AND Ci);
END dataflow;

