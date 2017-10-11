LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;
LIBRARY work;

entity BCDadder is 
port(
			A,B	: in std_logic_vector(3 downto 0);
			Aval	: out std_logic_vector(6 downto 0);
			Bval	: out std_logic_vector(6 downto 0);
			S1		: out std_logic_vector(6 downto 0);
			S0		: out std_logic_vector(6 downto 0)
		);
end entity;

architecture bahavioural of BCDadder is

component CALlogic is
port(
			Aval, Bval	: in std_logic_vector(3 downto 0);
			BCD1	    	: out std_logic_vector(6 downto 0);
			BCD0			: out std_logic_vector(6 downto 0)
		);
end component;

component circuitA
port(
		sum	: in std_logic_vector (3 downto 0);
		cout	: in std_logic;
		D1		:out std_logic_vector (6 downto 0);
		D0 	:out std_logic_vector (6 downto 0));
end component;

		signal siA : std_logic_vector (3 downto 0);
		signal siB : std_logic_vector (3 downto 0);
		signal siC : std_logic;
		signal siS : std_logic_vector (3 downto 0);

begin
inst1 : CALlogic
port map(A, B, siC, siS, siA, siB);

inst2 : circuitA
port map(siA, siB, siS, siC, Aval, Bval, S1, S0);

end bahavioural;
								
			