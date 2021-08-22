library verilog;
use verilog.vl_types.all;
entity Register_3 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        in2             : in     vl_logic;
        in1             : in     vl_logic;
        in0             : in     vl_logic;
        out2            : out    vl_logic;
        out1            : out    vl_logic;
        out0            : out    vl_logic
    );
end Register_3;
