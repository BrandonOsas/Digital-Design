LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;
LIBRARY work;

entity counter8 is
    port (
			  Enable	: in  std_logic;
			  clock	: in  std_logic;
			  clear	: in  std_logic;
			  Q		: buffer std_logic_vector (7 downto 0)
		 );
	end entity;

architecture foo of counter8 is
    component T_flipflop is
        port(
					t  	 : in std_logic;
					clock	 : in std_logic;
					reset  : in std_logic;
					q		 : out std_logic
			   );
    end component;
    signal st		 : std_logic_vector (6 downto 0); 
begin

    -- The seven AND gates:
    --t <=  ( Enable, Enable AND sq(0), st(1) AND sq(1), st(2) AND sq(2), st(3) AND sq(3),
	--			st(4) AND sq(4), st(5) AND sq(5), st(6) AND sq(6)
		--	  );

--  The eight T_flipflops:
tff0: T_flipflop
port map (Enable, clock, clear, Q(0));

st(0) <= Enable and Q(0);
tff1: T_flipflop
port map (st(0), clock, clear, Q(1));

st(1) <= st(0) and Q(1);
tff2: T_flipflop
port map (st(1), clock, clear, Q(2));

st(2) <= st(1) and Q(2);
tff3: T_flipflop
port map (st(2), clock, clear, Q(3));

st(3) <= st(2) and Q(3);
tff4: T_flipflop
port map (st(3), clock, clear, Q(4));

st(4) <= st(3) and Q(4);
tff5: T_flipflop
port map (st(4), clock, clear, Q(5));

st(5) <= st(4) and Q(5);
tff6: T_flipflop
port map (st(5), clock, clear, Q(6));

st(6) <= st(5) and Q(6);
tff7: T_flipflop
port map (st(6), clock, clear, Q(7));
end architecture;
------------------------------------------------------------------
