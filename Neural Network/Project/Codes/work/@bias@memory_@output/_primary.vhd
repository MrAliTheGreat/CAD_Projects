library verilog;
use verilog.vl_types.all;
entity BiasMemory_Output is
    generic(
        O_NODE_NUMBER   : integer := 10
    );
    port(
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of O_NODE_NUMBER : constant is 1;
end BiasMemory_Output;
