LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity ALU is 
	generic ( n: natural := 8);
	port ( AC: in std_logic_vector((n-1) downto 0); 
	     dataBus: in std_logic_vector((n-1) downto 0);
			 aluSelect: in std_logic_vector(7 downto 1);
			 dataOut	 : out std_logic_vector((n-1) downto 0));
end entity;

architecture behave of ALU is 
signal x2,x3,x4,p,notBU : std_logic_vector(n-1 downto 0);
component mux2 is 
	port (O 	 : in std_logic_vector(7 downto 0);
			AC  : in std_logic_vector(7 downto 0);
			SEL : in std_logic;
			Z1	 : out std_logic_vector(7 downto 0));
end component;

component mux3 is
	port (O 	 : in std_logic_vector(7 downto 0);
			B, B1   : in std_logic_vector(7 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			Z2	 : out std_logic_vector(7 downto 0));
end component;

component mux4 is 
	port (AC  : in std_logic_vector(7 downto 0);
			B	 : in std_logic_vector(7 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			Z3	 : out std_logic_vector(7 downto 0));
end component;

component padder is 
	port( a: in std_logic_vector (7 downto 0);
		b: in std_logic_vector (7 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector (7 downto 0));
end component;
begin
inst1 : mux2 port map ("00000000", AC,aluSelect(1), x2); -- (others =>'0')
notBU <= not(dataBus);
inst2 : mux3 port map ("00000000", dataBus, notBU, aluSelect(3 downto 2), x3);
inst3 : mux4 port map (AC, dataBus, aluSelect(5 downto 4), x4);
inst4 : padder port map (x2, x3, aluSelect(6), p);
inst5 : mux2 port map (p, x4, aluSelect(7), dataOut);
end;