LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;
--LIBRARY work;

entity T_flipflop is
port( 
		t  	 : in std_logic;
		clock	 : in std_logic;
		reset  : in std_logic;
		q		 : out std_logic
);
end entity T_flipflop;

architecture behavioural of T_flipflop is
	signal Qsig 	: std_logic;
	--signal Qreg	: std_logic;
begin
	process(reset, clock)
		begin
			if reset = '1' then
				Qsig <= '0';
			elsif (rising_edge (clock) and t='1') then
				Qsig <= not (Qsig);
			end if;
	end process;
	
OUTPUT:
	q <= Qsig;
	
end;


-----------------------------------------------------

