library verilog;
use verilog.vl_types.all;
entity eight_bit_multiplier is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end eight_bit_multiplier;
