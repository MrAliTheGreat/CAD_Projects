library verilog;
use verilog.vl_types.all;
entity neuron_LUT is
    generic(
        WIDTH           : integer := 32;
        INPUT_COUNT     : integer := 8
    );
    port(
        inputs          : in     vl_logic_vector;
        weights         : in     vl_logic_vector;
        start_signal    : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0);
        ready_signal    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
end neuron_LUT;
