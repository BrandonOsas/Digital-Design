LIBRARY ieee;
USE ieee.std_logic_1164.all; 
entity Control_Unit is
  port( IR	: in std_logic_vector(7 downto 0);
        Zin : in std_logic;
        clock: in std_logic;
        reset: in std_logic;
		  CU_out : out std_logic_vector(26 downto 0));
end entity Control_Unit;

architecture behave of Control_Unit is
--signal Tclk, Treset : STD_LOGIC;
signal INOP, ILDAC, ISTAC, IMVAC, IMOVR : STD_LOGIC;
signal IJUMP, IJMPZ, IJPNZ, IADD, ISUB : STD_LOGIC;
signal IINAC, ICLAC, IAND, IOR, IXOR, INOT : STD_LOGIC;
signal T0, T1, T2, T3, T4, T5, T6, T7, Z : STD_LOGIC;
------------------------------------------------------
signal Fetch1, Fetch2, Fetch3, NOP1 : STD_LOGIC;
signal LDAC1, LDAC2, LDAC3, LDAC4, LDAC5 : STD_LOGIC;
signal STAC1, STAC2, STAC3, STAC4, STAC5 : STD_LOGIC;
signal MVAC1, MOVR1, JUMP1, JUMP2, JUMP3, JMPZY1 : STD_LOGIC;
signal JMPZY2, JMPZY3, JMPZN1, JMPZN2, JPNZY1 : STD_LOGIC;
signal JPNZY2, JPNZY3, JPNZN1, JPNZN2, ADD1, SUB1 : STD_LOGIC;
signal INAC1, CLAC1, AND1, OR1, XOR1, NOT1 : STD_LOGIC;
--------------------------------------------------
signal D8in : STD_LOGIC_VECTOR (2 downto 0);
signal D8out : STD_LOGIC_VECTOR (7 downto 0);
signal D16out : STD_LOGIC_VECTOR (15 downto 0);

signal ALUS7, ALUS6, ALUS5, ALUS4, ALUS3,	ALUS2, ALUS1 : STD_LOGIC;
signal ARLOAD,	ARINC, PCLOAD,	PCINC, DRLOAD,	TRLOAD, IRLOAD, RLOAD, ACLOAD, ZLOAD	: STD_LOGIC;
signal PCBUS, DRHBUS, DRLBUS,	TRBUS, RBUS, ACBUS, MEMREAD, MEMWRITE, MEMBUS, BUSMEM : STD_LOGIC;
---------------------------------------------------------
component T_counter is
	Port ( clk   : in  STD_LOGIC;
         reset : in  STD_LOGIC;
         TC_out : out  STD_LOGIC_VECTOR (2 downto 0)
         );
end component;

component Decode8 is
	port( TC_out	: in std_logic_vector(2 downto 0);
		  opcode : out std_logic_vector(7 downto 0));
end component;

component Decode16 is
	port(IR		: in std_logic_vector(7 downto 0);
		  opcode : out std_logic_vector(15 downto 0));
end component;
-------------------------------------------------------------
begin
--------------control unit port map--------------------------
Decoder16 : Decode16
port map(IR, D16out);

Time_count : T_counter
port map (clock, reset, D8in);

Decoder8 : Decode8
port map (D8in, D8out);

---------------------------------------------------------------
Z    <= Zin;
INOP <= D16out(0) ;
ILDAC <= D16out(1);
ISTAC <= D16out(2);
IMVAC <= D16out(3);
IMOVR <= D16out(4);
IJUMP <= D16out(5);
IJMPZ <= D16out(6);
IJPNZ <= D16out(7);
IADD <= D16out(8);
ISUB <= D16out(9);
IINAC <= D16out(10);
ICLAC <= D16out(11);
IAND <= D16out(12);
IOR <= D16out(13);
IXOR <= D16out(14);
INOT <= D16out(15);

T0 <= D8out(0) ;
T1 <= D8out(1);
T2 <= D8out(2);
T3 <= D8out(3);
T4 <= D8out(4);
T5 <= D8out(5);
T6 <= D8out(6);
T7 <= D8out(7);
---------------------------------------------------------------------

Fetch1 <= T0;
Fetch2 <= T1;
Fetch3 <= T2;
NOP1 <= INOP AND T3;
LDAC1 <= ILDAC AND T3;
LDAC2 <= ILDAC AND T4;
LDAC3 <= ILDAC AND T5;
LDAC4 <= ILDAC AND T6;
LDAC5 <= ILDAC AND T7;
STAC1 <= ISTAC AND T3;
STAC2 <= ISTAC AND T4;
STAC3 <= ISTAC AND T5;
STAC4 <= ISTAC AND T6;
STAC5 <= ISTAC AND T7;
MVAC1 <= IMVAC AND T3;
MOVR1 <= IMOVR AND T3;
JUMP1 <= IJUMP AND T3;
JUMP2 <= IJUMP AND T4;
JUMP3 <= IJUMP AND T5;
JMPZY1 <= IJMPZ AND Z AND T3;
JMPZY2 <= IJMPZ AND Z AND T4;
JMPZY3 <= IJMPZ AND Z AND T5;
JMPZN1 <= IJMPZ AND NOT(Z) AND T3;
JMPZN2 <= IJMPZ AND NOT(Z) AND T4;
JPNZY1 <= IJMPZ AND Z AND T3;
JPNZY2 <= IJMPZ AND Z AND T4;
JPNZY3 <= IJMPZ AND Z AND T5;
JPNZN1 <= IJMPZ AND NOT(Z) AND T3;
JPNZN2 <= IJMPZ AND NOT(Z) AND T4;
ADD1 <= IADD AND T3;
SUB1 <= ISUB AND T3;
INAC1 <= IINAC AND T3;
CLAC1 <= ICLAC AND T3;
AND1 <= IAND AND T3;
OR1 <= IOR AND T3;
XOR1 <= IXOR AND T3;
NOT1 <= INOT AND T3;



ALUS7 <= AND1 AND SUB1 AND XOR1 AND NOT1;
ALUS6 <= OR1 AND NOT1;
ALUS5 <= XOR1 AND NOT1;
ALUS4 <= INAC1;
ALUS3 <= SUB1;	
ALUS2 <= ADD1 AND SUB1; 
ALUS1 <= ADD1 AND SUB1 AND INAC1;

ARLOAD <= Fetch1 AND Fetch3 AND LDAC3 AND STAC3;
ARINC  <= LDAC1 AND STAC1 AND JUMP1 AND JMPZY1 AND JPNZY1;
PCLOAD <= JUMP3 AND JMPZY3 AND JPNZY3;
PCINC  <= Fetch2 AND STAC1 AND STAC2 AND JMPZN1 AND 
			 JMPZN2 AND JPNZN1 AND JPNZN2;
DRLOAD <= Fetch2 AND LDAC1 AND LDAC2 AND LDAC4 AND STAC1 AND STAC2 AND 
				STAC4 AND JUMP1 AND JUMP2 AND JMPZY1 AND JMPZY2 AND JPNZN1 AND JPNZN2;
TRLOAD <= JUMP2 AND JMPZY1 AND JPNZN2;
IRLOAD <= Fetch3;
RLOAD  <= MVAC1;
ACLOAD <= LDAC5 AND MOVR1 AND ADD1 AND SUB1 AND INAC1 AND CLAC1 AND AND1 AND 
				OR1 AND XOR1 AND NOT1;
ZLOAD  <= ADD1 AND SUB1 AND INAC1 AND CLAC1 AND AND1 AND 
				OR1 AND XOR1 AND NOT1;

PCBUS  <= Fetch1 AND Fetch3;
DRHBUS  <= Fetch3 AND LDAC3 AND STAC3 AND JUMP3 AND JMPZY3 AND JPNZY3;
DRLBUS <= 	LDAC2 AND LDAC5 AND STAC5 AND JUMP2 AND JMPZY2 AND JPNZY2;
TRBUS  <= LDAC3 AND STAC2 AND STAC3 AND JUMP3 AND JMPZY3 AND JPNZY3; 
RBUS  <= MOVR1 AND ADD1 AND SUB1 AND AND1 AND OR1 AND XOR1;
ACBUS  <= STAC5 AND MVAC1;
MEMREAD  <= Fetch2 AND LDAC1 AND LDAC2 AND LDAC4 AND STAC1 AND STAC2 AND JUMP1 AND JUMP2
				AND JMPZY1 AND JMPZY2 AND JPNZY1 AND JPNZY2;
MEMWRITE  <= STAC5;
MEMBUS  <= Fetch2 AND LDAC1 AND LDAC2 AND LDAC4 AND STAC1 AND STAC2 AND JUMP1 AND JUMP2 AND
				JMPZY1 AND JMPZY2 AND JPNZY1 AND JPNZY2;  
BUSMEM <= STAC5;

CU_out(26) <= ALUS7;
CU_out(25) <= ALUS6;
CU_out(24) <= ALUS5;
CU_out(23) <= ALUS4;
CU_out(22) <= ALUS3;
CU_out(21) <= ALUS2;
CU_out(20) <= ALUS1;
CU_out(19) <= ARLOAD;
CU_out(18) <= ARINC;
CU_out(17) <= PCLOAD;
CU_out(16) <= PCINC;
CU_out(15) <= DRLOAD;
CU_out(14) <= TRLOAD;
CU_out(13) <= IRLOAD;
CU_out(12) <= RLOAD;
CU_out(11) <= ACLOAD;
CU_out(10) <= ZLOAD;
CU_out(9) <= PCBUS;
CU_out(8) <= DRHBUS;
CU_out(7) <= DRLBUS;
CU_out(6) <= TRBUS;
CU_out(5) <= RBUS;
CU_out(4) <= ACBUS;
CU_out(3) <= MEMREAD;
CU_out(2) <= MEMWRITE;
CU_out(1) <= MEMBUS;
CU_out(0) <= BUSMEM;
end behave;
