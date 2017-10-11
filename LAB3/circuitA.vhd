LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

entity circuitA is 
port(
		sum	: in std_logic_vector (3 downto 0);
		cout	: in std_logic;
		D1		:out std_logic_vector (6 downto 0);
		D0 	:out std_logic_vector (6 downto 0));
end circuitA;
ARCHITECTURE Behavioural OF circuitA IS
BEGIN
PROCESS(sum, cout)
begin 
case cout is
	when '0' =>
			case sum is
				when "0000" => D0 <= "0000001"; --when 0 D0=0
									D1 <= "0000001"; 		 --D1=0
									
				when "0001" => D0 <= "1001111"; --when 1 D0=1
									D1 <= "0000001"; 		 --D1=0
									
				when "0010" => D0 <= "0010010"; --when 2 D0=2
									D1 <= "0000001"; 		 --D1=0
									
				when "0011" => D0 <= "0000110"; --when 3 D0=3
									D1 <= "0000001"; 		 --D1=0
									
				when "0100" => D0 <= "1001100"; --when 4 D0=4
									D1 <= "0000001"; 		 --D1=0
									
				when "0101" => D0 <= "0100100"; --when 5 D0=5
									D1 <= "0000001"; 		 --D1=0
									
				when "0110" => D0 <= "0100000"; --when 6 D0=6
									D1 <= "0000001"; 		 --D1=0
									
				when "0111" => D0 <= "0001111"; --when 7 D0=7
									D1 <= "0000001"; 		 --D1=0
									
				when "1000" => D0 <= "0000000"; --when 8 D0=8
									D1 <= "0000001"; 		 --D1=0
									
				when "1001" => D0 <= "0000100"; --when 9 D0=9
									D1 <= "0000001"; 		 --D1=0
									
				when "1010" => D0 <= "0000001"; --when 10 D0=0
									D1 <= "1001111"; 		  --D1=1
									
				when "1011" => D0 <= "1001111"; --when 11 D0=1
									D1 <= "1001111"; 		  --D1=1
									
				when "1100" => D0 <= "0010010"; --when 12 D0=2
									D1 <= "1001111"; 		  --D1=1
									
				when "1101" => D0 <= "0000110"; --when 13 D0=3
									D1 <= "1001111"; 		  --D1=1
									
				when "1110" => D0 <= "1001100"; --when 14 D0=4
									D1 <= "1001111"; 		  --D1=1
									
				when "1111" => D0 <= "0100100"; --when 15 D0=5
									D1 <= "1001111"; 		  --D1=1
									
				when others => D0 <= "1111111"; --when others D0=off
									D1 <= "1111111";				   --D1=off
			end case;
	
	when '1' =>
			case sum is 
				when "0000" => D0 <= "0100000"; --when 16 D0=6
									D1 <= "1001111"; 		  --D1=1
									
				when "0001" => D0 <= "0001111"; --when 17 D0=7
									D1 <= "1001111"; 		  --D1=1
									
				when "0010" => D0 <= "0000000"; --when 18 D0=8
									D1 <= "1001111"; 		  --D1=1
									
				when "0011" => D0 <= "0000100"; --when 19 D0=9
									D1 <= "1001111"; 		  --D1=1
									
				when "0100" => D0 <= "0000001"; --when 20 D0=0
									D1 <= "0010010"; 		  --D1=2
									
				when "0101" => D0 <= "1001111"; --when 21 D0=1
									D1 <= "0010010"; 		  --D1=2
									
				when "0110" => D0 <= "0010010"; --when 22 D0=2
									D1 <= "0010010"; 		  --D1=2
									
				when "0111" => D0 <= "0000110"; --when 23 D0=3
									D1 <= "0010010"; 		  --D1=2
									
				when "1000" => D0 <= "1001100"; --when 24 D0=4
									D1 <= "0010010"; 		  --D1=2
									
				when "1001" => D0 <= "0100100"; --when 25 D0=5
									D1 <= "0010010"; 		  --D1=2
									
				when "1010" => D0 <= "0100000"; --when 26 D0=6
									D1 <= "0010010"; 		  --D1=2
									
				when "1011" => D0 <= "0001111"; --when 27 D0=7
									D1 <= "0010010"; 		  --D1=2
									
				when "1100" => D0 <= "0000000"; --when 28 D0=8
									D1 <= "0010010"; 		  --D1=2
									
				when "1101" => D0 <= "0000100"; --when 29 D0=9
									D1 <= "0010010"; 		  --D1=2									
									
				when "1110" => D0 <= "0000001"; --when 30 D0=0
									D1 <= "0000110"; 		  --D1=3
									
				when "1111" => D0 <= "1001111"; --when 31 D0=1
									D1 <= "0000110"; 		  --D1=3
									
				when others => D0 <= "1111111"; --when others D0=off
									D1 <= "1111111";				   --D1=off
			end case;
	when others =>
									D0 <= "1111111"; --when others D0=off
									D1 <= "1111111";				   --D1=off
end case;		
end process;
end;