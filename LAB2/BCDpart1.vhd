library ieee;
use ieee.std_logic_1164.all;
entity BCDpart1 is
port(
A,B,C,D : in std_logic; -- inputs A,B,C,D
display : out std_logic_vector(6 downto 0)
); --outputs D0,D1,D2,D3,D4,D5,D6);
end entity;

ARCHITECTURE dataflow OF BCDpart1 IS
BEGIN
		--for D0
		display(0) <= (NOT(A) AND B AND NOT(C) AND NOT(D)) OR (NOT(A) AND NOT(B) AND NOT(C) AND D);
		--for D1
		display(1) <= (B AND NOT(C) AND D) OR (B AND C AND NOT(D)) ;
		--for D2
		display(2) <= NOT(B) AND C AND NOT(D) ;
		--for D3
		display(3) <= (B AND NOT(C) AND NOT(D)) OR (B AND C AND D) OR (NOT(B) AND NOT(C) AND D) ;
		--for D4
		display(4) <= D OR (B AND NOT(C)) ;
		--for D5
		display(5) <= (C AND D) OR (NOT(B) AND C) OR (NOT(A) AND NOT(B) AND D) ;
		--for D6
		display(6) <= (NOT(A) AND NOT(B) AND NOT(C)) OR (B AND C AND D) ;
END;
