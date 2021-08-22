library verilog;
use verilog.vl_types.all;
entity DataMemory is
    generic(
        INPUT_COUNT     : integer := 62
    );
    port(
        dataGroupNumber : in     vl_logic_vector(10 downto 0);
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
end DataMemory;
