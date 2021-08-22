library verilog;
use verilog.vl_types.all;
entity Circuit is
    port(
        clk             : in     vl_logic;
        start_circuit   : in     vl_logic;
        dataGroupNumber : in     vl_logic_vector(10 downto 0);
        ready_circuit   : out    vl_logic;
        max_index       : out    vl_logic_vector(4 downto 0)
    );
end Circuit;
