library verilog;
use verilog.vl_types.all;
entity T_flipflop is
    port(
        t               : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        q               : out    vl_logic
    );
end T_flipflop;
