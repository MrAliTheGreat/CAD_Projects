library verilog;
use verilog.vl_types.all;
entity Shift is
    port(
        A3              : in     vl_logic;
        A2              : in     vl_logic;
        A1              : in     vl_logic;
        A0              : in     vl_logic;
        shctrl_1        : in     vl_logic;
        shctrl_0        : in     vl_logic;
        out7            : out    vl_logic;
        out6            : out    vl_logic;
        out5            : out    vl_logic;
        out4            : out    vl_logic;
        out3            : out    vl_logic;
        out2            : out    vl_logic;
        out1            : out    vl_logic;
        out0            : out    vl_logic
    );
end Shift;
