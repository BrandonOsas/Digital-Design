LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity register16 is 
		generic ( n: natural := 16);
		port ( inBus: in std_logic_vector((n-1) downto 0); 
			    enable: in std_logic;
				 clock, reset: in std_logic;
			   output: out std_logic_vector((n-1) downto 0));
end entity;

architecture behave of register16 is
	signal Q: std_logic_vector ((n-1) downto 0);
begin
	process(clock)
	begin
		if reset = '1' then 
			Q <= (others => '0');
		elsif rising_edge(clock) then
			Q <= inBus;
		end if;
	end process;
	   output <= Q;
end behave;