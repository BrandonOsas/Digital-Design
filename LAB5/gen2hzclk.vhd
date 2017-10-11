library ieee;
use ieee.std_logic_1164.all;
entity gen2Hzclk is
port 
(
	clk_50MHz : in std_logic;
	clk_2Hz 	 : out std_logic
);
end gen2Hzclk;
Architecture behavioural of gen2Hzclk is
begin
process(clk_50MHz)
	variable cyclecounter : integer range 0 to 25000000 ;
	begin
	if(rising_edge(clk_50MHz)) then
		if (cyclecounter < 25000000) then
			cyclecounter := cyclecounter + 1 ;
			clk_2Hz <= '0';
		else
			cyclecounter := 0;
			clk_2Hz <= '1';
		end if;
	end if;
end process;
end;
