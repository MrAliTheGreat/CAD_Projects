library verilog;
use verilog.vl_types.all;
entity WeightsMemory_Hidden is
    generic(
        INPUT_COUNT     : integer := 62;
        H_NODE_NUMBER   : integer := 20
    );
    port(
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
    attribute mti_svvh_generic_type of H_NODE_NUMBER : constant is 1;
end WeightsMemory_Hidden;
