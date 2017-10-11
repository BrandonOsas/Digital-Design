LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity register1 is 
		port ( inBus: in std_logic; 
			    enable: in std_logic;
				 clock, reset: in std_logic;
			   output: out std_logic);
end entity;

architecture behave of register1 is
	signal Q: std_logic;
begin
	process(clock)
	begin
		if reset = '1' then 
			Q <= '0';
		elsif rising_edge(clock) then
			Q <= inBus;
		end if;
	end process;
	output <= Q;
end behave;