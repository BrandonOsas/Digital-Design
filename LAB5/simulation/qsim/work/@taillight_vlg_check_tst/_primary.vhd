library verilog;
use verilog.vl_types.all;
entity Taillight_vlg_check_tst is
    port(
        Lights          : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end Taillight_vlg_check_tst;
