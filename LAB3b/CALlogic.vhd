LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;
LIBRARY work;

entity CALlogic is 
port(
			A,B	: in std_logic_vector(3 downto 0);
			Cin	: in std_logic;
			S1		: out std_logic_vector (6 downto 0);
			S0		: out std_logic_vector (6 downto 0)
		);
end entity;

architecture bahavioural of CALlogic is

component BCDpart2 is
port(
inputs : in std_logic_vector(3 downto 0) ; -- inputs A,B,C,D
display : out std_logic_vector(6 downto 0)); -- outputs D0,D1,D2,D3,D4,D5,D6
end component;


		signal T : std_logic_vector (4 downto 0);
		signal Z : std_logic_vector (4 downto 0);
		signal S : std_logic_vector (4 downto 0); --sum
		signal C : std_logic; -- carry

		
begin
inst : BCDpart2 port map(S(3 downto 0),S0);
inst2 : BCDpart2 port map(("000" & C),S1);

process (A,B)
		begin
		
				T <= ('0' & A) + ('0' & B);
				if (T > 9) 
				then
						Z <= "01010";
						C <= '1';
				
				else	
						Z <= "00000";
						C <= '0';
				end if ;
				S <= T - Z;
				--S1 <= ("0000" & C);
end process;
				
end bahavioural;
					
-----

library ieee;
use ieee.std_logic_1164.all;
entity BCDpart2 is
port(
inputs : in std_logic_vector(3 downto 0) ; -- inputs A,B,C,D
display : out std_logic_vector(6 downto 0) -- outputs D0,D1,D2,D3,D4,D5,D6
);
end;
ARCHITECTURE Behavioural OF BCDpart2 IS
BEGIN
PROCESS(inputs)
begin
case inputs is
when "0000" => display <= "0000001";
when "0001" => display <= "1001111";
when "0010" => display <= "0010010";
when "0011" => display <= "0000110";
when "0100" => display <= "1001100";
when "0101" => display <= "0100100";
when "0110" => display <= "0100000";
when "0111" => display <= "0001111";
when "1000" => display <= "0000000";
when "1001" => display <= "0000100";
when others => display <= "1111111";
end case;
end process;
end;		
			