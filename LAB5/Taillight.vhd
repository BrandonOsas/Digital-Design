LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity Taillight is 
	port (
			clock: in std_logic;
			reset: in std_logic;
			L 	  : in std_logic;
			R 	  : in std_logic;
			Haz  : in std_logic;
			Lights:buffer std_logic_vector(5 downto 0)
			);
end entity;
architecture behaviour of Taillight is 
	subtype state is std_logic_vector (5 downto 0);
	constant allOFF: state := "000000";--0ff
	constant LA: state := "100000";--1
	constant LB: state := "110000";--2
	constant LC: state := "111000";--3
	constant RA: state := "000001";--4
	constant RB: state := "000011";--5
	constant RC: state := "000111";--6
	constant allON: state := "111111";--on		
	
begin
	process (clock)
	begin
		if rising_edge(clock) and clock = '1' then
			if (reset = '1') then
				Lights <= allOFF; else
		case Lights is 
		when allOFF => if Haz = '1' or (L = '1' and R = '1')
							 then Lights <= allON;
							 elsif L = '1' then Lights <= LA;
							 elsif R = '1' then Lights <= RA;
							 else Lights <= allOFF;
							 end if;
			when LA => if Haz = '1' then
				  Lights <= allON; 	else
				  Lights <= LB;		end if;
				  
			when LB => if Haz = '1' then
				  Lights <= allON; 	else
				  Lights <= LC;		end if;
				  
			when LC => Lights <= allOFF;
			
			when RA => if Haz = '1' then
				  Lights <= allON; else
				  Lights <= RB;			end if;
				  
			when RB => if Haz = '1' then
				  Lights <= allON; 	else
				  Lights <= RC;		end if;
				  
			when RC => Lights <= allOFF;
			
			when allON =>Lights <= allOFF;
			when others => null;
			
		end case;
		end if;
		end if;
	end process;
end behaviour;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	