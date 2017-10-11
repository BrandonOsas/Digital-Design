Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity exam2 is 
	port( T,RST,CLK : in std_logic;
			Q			 : out std_logic);
end entity;

architecture behavioural of exam2 is 
signal Qsig : std_logic;
begin
	process(T,RST,CLK)
	begin
		if RST = '0' then
				Qsig <= '0';
		elsif (rising_edge(CLK) and T='1') then 
				Qsig <= not(Qsig);
		end if;
	end process;
		Q <= Qsig ;
end behavioural ;
