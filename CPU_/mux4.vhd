LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity mux4 is 
	port (
			AC  : in std_logic_vector(7 downto 0);
			B	 : in std_logic_vector(7 downto 0);
			SEL : in std_logic_vector(1 downto 0);
			Z3	 : out std_logic_vector(7 downto 0));
end mux4;

architecture behave of mux4 is 
signal M1, M2, M3, M4 : std_logic_vector(7 downto 0);

begin
M1 <= AC and B;
M2 <= AC or B;
M3 <= AC xor B;
M4 <= not(AC);
	process(SEL,AC,B)
	begin 
	 case SEL is 
	 when "00" => Z3 <= M1;
	 when "01" => Z3 <= M2;
	 when "10" => Z3 <= M3;
	 when "11" => Z3 <= M4;
	 when others => Z3 <= "00000000";
	 end case;
	end process;
end behave;