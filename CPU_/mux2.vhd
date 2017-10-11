LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity mux2 is 
	port (O 	 : in std_logic_vector(7 downto 0);
			AC  : in std_logic_vector(7 downto 0);
			SEL : in std_logic;
			Z1	 : out std_logic_vector(7 downto 0));
end mux2;

architecture behave of mux2 is 
begin 
	Z1 <= AC when (SEL = '1') else O;
end behave;
