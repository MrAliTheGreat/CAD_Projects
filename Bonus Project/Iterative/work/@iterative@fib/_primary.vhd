library verilog;
use verilog.vl_types.all;
entity IterativeFib is
    port(
        start           : in     vl_logic;
        clk             : in     vl_logic;
        n               : in     vl_logic_vector(3 downto 0);
        ready           : out    vl_logic;
        \out\           : out    vl_logic_vector(10 downto 0)
    );
end IterativeFib;
