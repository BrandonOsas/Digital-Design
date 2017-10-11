library verilog;
use verilog.vl_types.all;
entity counter8 is
    port(
        Enable          : in     vl_logic;
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end counter8;
