LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

ENTITY exam is 
	port ( 
			E		: in std_logic;
			clock : in std_logic;
			reset : in std_logic;
			Z		: out std_logic
			);
end entity;

architecture behaviour of exam is 
	type state is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal present_state, next_state : state;
	--constant s0: state := "0";--0
	--constant s1: state := "1";--1
	--constant s2: state := "0";--2
	--constant s3: state := "0";--3
	--constant s4: state := "0";--4
	--constant s5: state := "0";--5
	--constant s6: state := "0";--6
	--constant s7: state := "1";--7
begin
	process(clock)
	begin
		if (reset = '1') then 
			present_state <= s7;
		elsif (rising_edge(clock) and clock = '1') then 
			present_state <= next_state;
		end if;
	end process;
	
	process(E, present_state)
	begin 
		case present_state is 
			when s7 => if(E ='0') then next_state <= s7;
							else next_state <= s0;
							end if;
			when s0 => next_state <= s1;
			when s1 => next_state <= s2;
			when s2 => next_state <= s3;
			when s3 => next_state <= s4;
			when s4 => next_state <= s5;
			when s5 => next_state <= s6;
			when s6 => next_state <= s7;
		end case;
	end process;
	z <= '1' when ((present_state = s7) or (present_state = s1)) else '0';
end behaviour;
	
		