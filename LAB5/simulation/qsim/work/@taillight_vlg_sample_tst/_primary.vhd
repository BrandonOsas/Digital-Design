library verilog;
use verilog.vl_types.all;
entity Taillight_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        Haz             : in     vl_logic;
        L               : in     vl_logic;
        R               : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Taillight_vlg_sample_tst;
