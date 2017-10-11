--parallel adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity padder is
	generic(
  N : integer := 8);
  port (
  a, b : in std_logic_vector(n-1 downto 0);
  cin : in std_logic;
  S : out std_logic_vector(n-1 downto 0));
  --Cout : out std_logic);
  end padder;
  
  architecture behav of padder is
  begin
  	add_sub : process (a, b)
    	variable sum : std_logic_vector(N downto 0);
		begin
    	sum := ('0' & a) + ('0' & b) + ("00000000" & cin)  ;
      S <= sum(N-1 downto 0);
      --Cout <= sum(N);
    end process;
  end behav;
      