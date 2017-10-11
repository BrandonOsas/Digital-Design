library verilog;
use verilog.vl_types.all;
entity T_flipflop_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        t               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end T_flipflop_vlg_sample_tst;
