library verilog;
use verilog.vl_types.all;
entity Stack is
    port(
        clk             : in     vl_logic;
        R_W             : in     vl_logic_vector(1 downto 0);
        PUSH            : in     vl_logic_vector(31 downto 0);
        POP             : out    vl_logic_vector(31 downto 0)
    );
end Stack;
