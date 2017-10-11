LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity buffer16 is 
		generic ( n: natural := 16);
		port ( inBus: in std_logic_vector((n-1) downto 0); 
				enable: in std_logic;
			   outBus: buffer std_logic_vector((n-1) downto 0));
end entity;

architecture behave of buffer16 is
begin
	process(enable, inBus)
		begin
			if (enable = '1') then
				outBus <= inBus;
			else 
				outBus <= (others => 'Z');
			end if;
		end process;
	end behave;