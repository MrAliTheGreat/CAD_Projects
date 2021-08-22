library verilog;
use verilog.vl_types.all;
entity Adder_8 is
    port(
        A7              : in     vl_logic;
        A6              : in     vl_logic;
        A5              : in     vl_logic;
        A4              : in     vl_logic;
        A3              : in     vl_logic;
        A2              : in     vl_logic;
        A1              : in     vl_logic;
        A0              : in     vl_logic;
        B7              : in     vl_logic;
        B6              : in     vl_logic;
        B5              : in     vl_logic;
        B4              : in     vl_logic;
        B3              : in     vl_logic;
        B2              : in     vl_logic;
        B1              : in     vl_logic;
        B0              : in     vl_logic;
        out7            : out    vl_logic;
        out6            : out    vl_logic;
        out5            : out    vl_logic;
        out4            : out    vl_logic;
        out3            : out    vl_logic;
        out2            : out    vl_logic;
        out1            : out    vl_logic;
        out0            : out    vl_logic;
        cout            : out    vl_logic
    );
end Adder_8;
