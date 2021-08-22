library verilog;
use verilog.vl_types.all;
entity BiasMemory_Hidden is
    generic(
        H_NODE_NUMBER   : integer := 20
    );
    port(
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of H_NODE_NUMBER : constant is 1;
end BiasMemory_Hidden;
