library verilog;
use verilog.vl_types.all;
entity Neurons is
    generic(
        INPUT_COUNT     : integer := 62;
        H_NODE_NUMBER   : integer := 20;
        O_NODE_NUMBER   : integer := 10
    );
    port(
        clk             : in     vl_logic;
        start_signal    : in     vl_logic;
        ctrl_data_w_b_neuron: in     vl_logic_vector(1 downto 0);
        inputs          : in     vl_logic_vector;
        out_regs        : in     vl_logic_vector;
        H_weights       : in     vl_logic_vector;
        O_weights       : in     vl_logic_vector;
        H_bias          : in     vl_logic_vector;
        O_bias          : in     vl_logic_vector;
        out1            : out    vl_logic_vector(7 downto 0);
        out2            : out    vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(7 downto 0);
        out4            : out    vl_logic_vector(7 downto 0);
        out5            : out    vl_logic_vector(7 downto 0);
        out6            : out    vl_logic_vector(7 downto 0);
        out7            : out    vl_logic_vector(7 downto 0);
        out8            : out    vl_logic_vector(7 downto 0);
        out9            : out    vl_logic_vector(7 downto 0);
        out10           : out    vl_logic_vector(7 downto 0);
        ready1          : out    vl_logic;
        ready2          : out    vl_logic;
        ready3          : out    vl_logic;
        ready4          : out    vl_logic;
        ready5          : out    vl_logic;
        ready6          : out    vl_logic;
        ready7          : out    vl_logic;
        ready8          : out    vl_logic;
        ready9          : out    vl_logic;
        ready10         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
    attribute mti_svvh_generic_type of H_NODE_NUMBER : constant is 1;
    attribute mti_svvh_generic_type of O_NODE_NUMBER : constant is 1;
end Neurons;
