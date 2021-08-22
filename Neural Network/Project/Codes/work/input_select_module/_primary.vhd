library verilog;
use verilog.vl_types.all;
entity input_select_module is
    generic(
        INPUT_COUNT     : integer := 62
    );
    port(
        inputs          : in     vl_logic_vector;
        weights         : in     vl_logic_vector;
        indices         : in     vl_logic_vector(7 downto 0);
        value_out       : out    vl_logic_vector(7 downto 0);
        weight_out      : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
end input_select_module;
