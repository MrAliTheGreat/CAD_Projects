library verilog;
use verilog.vl_types.all;
entity Recursive is
    port(
        clk             : in     vl_logic;
        n               : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(10 downto 0)
    );
end Recursive;
