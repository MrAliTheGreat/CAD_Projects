library verilog;
use verilog.vl_types.all;
entity MUX_2to1 is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        sel             : in     vl_logic;
        \out\           : out    vl_logic
    );
end MUX_2to1;
