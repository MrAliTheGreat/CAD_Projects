library verilog;
use verilog.vl_types.all;
entity C1 is
    port(
        A1              : in     vl_logic;
        A0              : in     vl_logic;
        B1              : in     vl_logic;
        B0              : in     vl_logic;
        SA              : in     vl_logic;
        SB              : in     vl_logic;
        S1              : in     vl_logic;
        S0              : in     vl_logic;
        F               : out    vl_logic
    );
end C1;
