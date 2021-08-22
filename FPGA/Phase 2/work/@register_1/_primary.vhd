library verilog;
use verilog.vl_types.all;
entity Register_1 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end Register_1;
