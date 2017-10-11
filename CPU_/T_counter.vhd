LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity T_counter is
  Port ( clk   : in  STD_LOGIC;
         reset : in  STD_LOGIC;
         TC_out : out  STD_LOGIC_VECTOR (2 downto 0)
         );
end T_counter;

architecture Behave of T_counter is
	subtype state is std_logic_vector (2 downto 0);
	signal present_state, next_state : state;
	constant state0: state := "000";--0
	constant state1: state := "001";--1
	constant state2: state := "010";--2
	constant state3: state := "011";--3
	constant state4: state := "100";--4
	constant state5: state := "101";--5
	constant state6: state := "110";--6
	constant state7: state := "111";--7
begin
	process (clk)
		begin
			if rising_edge(clk) then
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
				when state7 => next_state <= state0;
				when others => null;
			end case;
			TC_out <= present_state;
	end process;
	
	
	
	        
end Behave;
