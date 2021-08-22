library verilog;
use verilog.vl_types.all;
entity FullAdder is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        cin             : in     vl_logic;
        sum             : out    vl_logic;
        cout            : out    vl_logic
    );
end FullAdder;
