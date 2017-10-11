LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY LAb1 is
	PORT (x1, x2: IN	STD_logic;
			 f		:OUT	STD_LOGIC);
END Lab1;

ARCHITECTURE LogicFunction OF Lab1 is
BEGIN
	f<=(x1 AND NOT x2) OR (NOT x1 AND x2);
END LogicFunction;