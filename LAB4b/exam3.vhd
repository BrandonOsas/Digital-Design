LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
entity exam3 is 
	port( EN,CLK,CL : in std_logic;
			Q			 : buffer std_logic_vector (3 downto 0));
end entity;

architecture struct of exam3 is 

component exam2 is
	port( T,RST,CLK : in std_logic;
			Q 			 : out std_logic);
end component;

signal E : std_logic_vector (2 downto 0);
begin
inst0 : exam2 port map (EN,CLK,CL,Q(0));

inst1 : exam2 port map (E(0),CLK,CL,Q(1));
E(0) <= (EN and Q(0));

inst2 : exam2 port map (E(1),CLK,CL,Q(2));
E(1) <= (E(0) and Q(1));

inst3 : exam2 port map (E(2),CLK,CL,Q(3));
E(2) <= (E(1) and Q(2));

end struct;