library verilog;
use verilog.vl_types.all;
entity accumulator_reg is
    generic(
        WIDTH           : integer := 32
    );
    port(
        a_in            : in     vl_logic_vector;
        clk             : in     vl_logic;
        en              : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end accumulator_reg;
