LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity mux3 is 
	port (O 	 : in std_logic_vector(7 downto 0);
			B, B1   : in std_logic_vector(7 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			Z2	 : out std_logic_vector(7 downto 0));
end mux3;

architecture behave of mux3 is
begin 
	process(SEL,O,B,B1)
	begin 
	 case SEL is 
	 when "00" => Z2 <= O;
	 when "01" => Z2 <= B;
	 when "10" => Z2 <= B1;
	 when others => Z2 <= "00000000";
	 end case;
	end process;
end behave;