library verilog;
use verilog.vl_types.all;
entity activation_function is
    generic(
        WIDTH           : integer := 32
    );
    port(
        a_input         : in     vl_logic_vector;
        bias            : in     vl_logic_vector(7 downto 0);
        ctrl_data       : in     vl_logic_vector(1 downto 0);
        ready_signal    : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end activation_function;
