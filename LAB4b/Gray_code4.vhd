LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity Gray_code4 is
	port ( 
			clock : in std_logic;
			reset : in std_logic;
			Q		: out std_logic_vector(3 downto 0)
			);
end entity;

architecture behaviour of Gray_code4 is 
	subtype state is std_logic_vector (3 downto 0);
	signal present_state, next_state : state;
	constant state0: state := "0000";--0
	constant state1: state := "0001";--1
	constant state2: state := "0011";--2
	constant state3: state := "0010";--3
	constant state4: state := "0110";--4
	constant state5: state := "0111";--5
	constant state6: state := "0101";--6
	constant state7: state := "0100";--7
	constant state8: state := "1100";--8
	constant state9: state := "1101";--9
	constant state10: state := "1111";--10
	constant state11: state := "1110";--11
	constant state12: state := "1010";--12
	constant state13: state := "1011";--13
	constant state14: state := "1001";--14
	constant state15: state := "1000";--15
begin
	process (clock)
		begin
		if rising_edge(clock) then
			if (reset = '1') then
				present_state <= state0;
			else 
				present_state <= next_state;
			end if;
		end if;
	end process;
	
	process (present_state)
		begin
			case present_state is 
				when state0 => next_state <= state1;--0
				when state1 => next_state <= state2;--1
				when state2 => next_state <= state3;--2
				when state3 => next_state <= state4;--3
				when state4 => next_state <= state5;--4
				when state5 => next_state <= state6;--5
				when state6 => next_state <= state7;--6
				when state7 => next_state <= state8;--7
				when state8 => next_state <= state9;--8
				when state9 => next_state <= state10;--9
				when state10 => next_state <= state11;--10
				when state11 => next_state <= state12;--11
				when state12 => next_state <= state13;--12
				when state13 => next_state <= state14;--13
				when state14 => next_state <= state15;--14
				when state15 => next_state <= state0;--15
			end case;
			Q <=present_state;
	end process;
end behaviour;