LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity counter16 is
    port (
			  Enable	: in  std_logic;
			  clock	: in  std_logic;
			  clear	: in  std_logic;
			  Q		: buffer std_logic_vector (15 downto 0)
		 );
	end entity;
	architecture behavioural of counter16 is
	 signal sq		 : std_logic_vector (15 downto 0); 
begin 

	process(Enable, clock, clear)
	begin
		if clear = '1' then
			sq <= sq - sq;
		elsif (rising_edge(clock) and Enable = '1') then
			sq <= sq + '1';
		end if;
	end process;
	OUTPUT:
	Q <= sq;
	
end behavioural;
		