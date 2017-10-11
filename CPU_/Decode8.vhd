LIBRARY ieee;
USE ieee.std_logic_1164.all; 
entity Decode8 is
  port( TC_out	: in std_logic_vector(2 downto 0);
		  opcode : out std_logic_vector(7 downto 0));
end Decode8;

architecture structure of Decode8 is
begin 
	process(TC_out)--hardwired
		begin
		  case TC_out is 
			when "000" => opcode <= "00000001"; -- T0
			when "001" => opcode <= "00000010"; -- T1
			when "010" => opcode <= "00000100"; -- T2
			when "011" => opcode <= "00001000"; -- T3
			when "100" => opcode <= "00010000"; -- T4
			when "101" => opcode <= "00100000"; -- T5
			when "110" => opcode <= "01000000"; -- T6
			when "111" => opcode <= "10000000"; -- T7
			when others => opcode <= "00000000";
		end case;
	end process;
end structure;