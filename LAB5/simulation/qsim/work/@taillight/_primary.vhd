library verilog;
use verilog.vl_types.all;
entity Taillight is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        L               : in     vl_logic;
        R               : in     vl_logic;
        Haz             : in     vl_logic;
        Lights          : out    vl_logic_vector(5 downto 0)
    );
end Taillight;
