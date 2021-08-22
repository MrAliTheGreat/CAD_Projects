library verilog;
use verilog.vl_types.all;
entity XOR_gate is
    port(
        \out\           : out    vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic
    );
end XOR_gate;
