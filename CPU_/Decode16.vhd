LIBRARY ieee;
USE ieee.std_logic_1164.all; 
entity Decode16 is
  port(IR		: in std_logic_vector(7 downto 0);
		  opcode : out std_logic_vector(15 downto 0));
end Decode16;

architecture structure of Decode16 is
signal IRlow: std_logic_vector(3 downto 0);
begin 
IRlow <= IR(3 downto 0);

	process(IRlow)--hardwired
		begin
		  case IRlow is 
			when "0000" => opcode <= "0000000000000001"; -- INOP
			when "0001" => opcode <= "0000000000000010"; -- ILDAC
			when "0010" => opcode <= "0000000000000100"; -- ISTAC
			when "0011" => opcode <= "0000000000001000"; -- IMVAC
			when "0100" => opcode <= "0000000000010000"; -- IMOVR
			when "0101" => opcode <= "0000000000100000"; -- IJUMP
			when "0110" => opcode <= "0000000001000000"; -- IJMPZ
			when "0111" => opcode <= "0000000010000000"; -- IJPNZ
			when "1000" => opcode <= "0000000100000000"; -- IADD
			when "1001" => opcode <= "0000001000000000"; -- ISUB
			when "1010" => opcode <= "0000010000000000"; -- IINAC
			when "1011" => opcode <= "0000100000000000"; -- ICLAC
			when "1100" => opcode <= "0001000000000000"; -- IAND
			when "1101" => opcode <= "0010000000000000"; -- IOR
			when "1110" => opcode <= "0100000000000000"; -- IXOR
			when "1111" => opcode <= "1000000000000000"; -- INOT
			when others => opcode <= "0000000000000000";
		end case;
	end process;
end structure;