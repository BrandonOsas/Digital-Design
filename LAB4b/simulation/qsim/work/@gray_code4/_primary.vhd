library verilog;
use verilog.vl_types.all;
entity Gray_code4 is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        Q               : out    vl_logic_vector(3 downto 0)
    );
end Gray_code4;
