library verilog;
use verilog.vl_types.all;
entity counter16_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        Enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end counter16_vlg_sample_tst;
