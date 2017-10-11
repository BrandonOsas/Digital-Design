LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;

entity RS_CPU is 
		port ( dataBus1: inout std_logic_vector(7 downto 0); 
				 dataBus2: inout std_logic_vector(7 downto 0);
			    load: in std_logic;
				 clock, reset: in std_logic;
			   Address: out std_logic_vector(15 downto 0));
end entity;

architecture behave of RS_CPU is 
signal PCout,outPC: std_logic_vector(15 downto 0);
signal DRout, TRout, IRout, Rout, ACout, ALUout: std_logic_vector(7 downto 0);
signal outTR, outR, outAC: std_logic_vector(7 downto 0);
signal ALUS : std_logic_vector(7 downto 1);
signal PCbus, DRHbus, DRLbus, TRbus, Rbus, ACbus : std_logic;
signal Zin, Zout: std_logic;
--signal BUS1: std_logic_vector(7 downto 0);
signal BUS2: std_logic_vector(15 downto 0);
component ALU is 
	port ( AC: in std_logic_vector(7 downto 0); 
	     dataBus: in std_logic_vector(7 downto 0);
			 aluSelect: in std_logic_vector(7 downto 1);
			 dataOut	 : out std_logic_vector(7 downto 0));
end component;

component register8 is 
	port ( inBus: in std_logic_vector(7 downto 0); 
			    enable: in std_logic;
				 clock, reset: in std_logic;
			   output: out std_logic_vector(7 downto 0));
end component;

component register16 is 
	port ( inBus: in std_logic_vector(15 downto 0); 
			    enable: in std_logic;
				 clock, reset: in std_logic;
			   output: out std_logic_vector(15 downto 0));
end component;

component register1 is 
	port ( inBus: in std_logic; 
			    enable: in std_logic;
				 clock, reset: in std_logic;
			   output: out std_logic);
end component;

component buffer8 is 
	port ( inBus: in std_logic_vector(7 downto 0); 
				enable: in std_logic;
			   outBus: buffer std_logic_vector(7 downto 0));
end component;

component buffer16 is 
	port ( inBus: in std_logic_vector(15 downto 0); 
				enable: in std_logic;
			   outBus: buffer std_logic_vector(15 downto 0));
end component;

begin
BUS2(7 downto 0) <= dataBus1;
BUS2(15 downto 8) <= dataBus2;
-------------REGISTER16--------------------------
AR : register16 
port map (BUS2, load, clock, reset, Address);

PC : register16 
port map (BUS2, load, clock, reset, PCout);

-------------REGISTER8--------------------------
DR : register8 
port map (dataBus1, load, clock, reset, DRout);

TR : register8 
port map (DRout, load, clock, reset, TRout);

IR : register8 
port map (DRout, load, clock, reset, IRout);

R : register8
port map (dataBus1, load, clock, reset, Rout);

AC : register8
port map (ALUout, load, clock, reset, ACout);

-------------REGISTER1--------------------------
Zin <= NOT(ALUout(0) OR ALUout(1) OR ALUout(2) OR ALUout(3) OR ALUout(4)
					  OR ALUout(5) OR ALUout(6) OR ALUout(7));
Z : register1
port map (Zin, load, clock, reset, Zout);

-------------ALU--------------------------
ALUa : ALU
port map (ACout, dataBus1, ALUS, ALUout);

-------------BUFFER16--------------------------
PCBUF : buffer16
port map (PCout, PCbus, outPC);

-------------BUFFER8--------------------------
DRHBUF : buffer8
port map (DRout, DRHbus, dataBus2);

DRLBUF : buffer8
port map (DRout, DRLbus, dataBus1);

TRBUF : buffer8
port map (TRout, TRbus, outTR);

RBUF : buffer8
port map (Rout, Rbus, outR);

ACBUF : buffer8
port map (ACout, ACbus, outAC);

end behave;



