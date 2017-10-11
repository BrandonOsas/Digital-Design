LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

entity calculator is 
port ( calA, calB		: in std_logic_vector(3 downto 0);
				calD1		: out std_logic_vector(6 downto 0);
				calD0		: out std_logic_vector(6 downto 0));
end entity;

architecture structural of calculator is 

component adder4 is 
port
	(a, b :  IN  std_logic_vector(3 downto 0);
	   Ci :  IN  std_logic;
		  S:  OUT std_logic_vector(3 downto 0);
	 Cout :  OUT std_logic);
end component;

component circuitA is 
port(
		sum	: in std_logic_vector (3 downto 0);
		cout	: in std_logic;
		D1		:out std_logic_vector (6 downto 0);
		D0 	:out std_logic_vector (6 downto 0));
end component;


signal calS : std_logic_vector(3 downto 0);
signal calC : std_logic;


begin

calculate0 : adder4
port map (calA, calB, '0', calS, calC);

calculate1 : circuitA
port map (calS, calC, calD1, calD0);


end structural;












