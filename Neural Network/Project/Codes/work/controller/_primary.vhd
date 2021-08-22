library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        start_signal    : in     vl_logic;
        ctrl_data       : in     vl_logic_vector(1 downto 0);
        ready_signal    : out    vl_logic;
        index           : out    vl_logic_vector(7 downto 0)
    );
end controller;
