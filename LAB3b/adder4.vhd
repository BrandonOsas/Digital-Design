LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder4 IS 
	PORT
	(a, b :  IN  std_logic_vector(3 downto 0);
	   Ci :  IN  std_logic;
		  S:  OUT std_logic_vector(3 downto 0);
	 Cout :  OUT std_logic);
END adder4;

ARCHITECTURE bdf_type OF adder4 IS 

COMPONENT fulladder
	PORT(A, B, Ci: IN STD_LOGIC;
		    Co, S : OUT STD_LOGIC);
END COMPONENT;

SIGNAL	C :  std_logic_vector(2 downto 0);


BEGIN 

b2v_inst : fulladder
PORT MAP(A(0), B(0),Ci, C(0), S(0));

b2v_inst1 : fulladder
PORT MAP(A(1), B(1),C(0), C(1), S(1));

b2v_inst2 : fulladder
PORT MAP(A(2), B(2),C(1), C(2), S(2));

b2v_inst3 : fulladder
PORT MAP(A(3), B(3),C(2), Cout, S(3));
END bdf_type;