library verilog;
use verilog.vl_types.all;
entity multiplier_ip is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end multiplier_ip;
