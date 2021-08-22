library verilog;
use verilog.vl_types.all;
entity adder is
    generic(
        WIDTH           : integer := 32
    );
    port(
        a_in            : in     vl_logic_vector;
        b_in            : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder;
