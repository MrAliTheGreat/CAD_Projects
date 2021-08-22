library verilog;
use verilog.vl_types.all;
entity four_bit_multiplier is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end four_bit_multiplier;
