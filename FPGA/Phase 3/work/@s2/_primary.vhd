library verilog;
use verilog.vl_types.all;
entity S2 is
    port(
        D00             : in     vl_logic;
        D01             : in     vl_logic;
        D10             : in     vl_logic;
        D11             : in     vl_logic;
        A1              : in     vl_logic;
        B1              : in     vl_logic;
        A0              : in     vl_logic;
        B0              : in     vl_logic;
        clr             : in     vl_logic;
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end S2;
