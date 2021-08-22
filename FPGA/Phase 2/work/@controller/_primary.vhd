library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        rst_out         : out    vl_logic;
        ld_A            : out    vl_logic;
        ld_B            : out    vl_logic;
        l_1             : out    vl_logic;
        l_2             : out    vl_logic;
        shctrl_1        : out    vl_logic;
        shctrl_0        : out    vl_logic;
        ld_out          : out    vl_logic
    );
end Controller;
