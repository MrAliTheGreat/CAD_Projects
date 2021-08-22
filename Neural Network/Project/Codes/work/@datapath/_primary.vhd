library verilog;
use verilog.vl_types.all;
entity Datapath is
    generic(
        INPUT_COUNT     : integer := 62;
        H_NODE_NUMBER   : integer := 20;
        O_NODE_NUMBER   : integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        startNeurons    : in     vl_logic;
        ld_regs1        : in     vl_logic;
        ld_regs2        : in     vl_logic;
        enMax           : in     vl_logic;
        ctrl_w_b_data_neuron: in     vl_logic_vector(1 downto 0);
        dataGroupNumber : in     vl_logic_vector(10 downto 0);
        ready1          : out    vl_logic;
        ready2          : out    vl_logic;
        ready3          : out    vl_logic;
        ready4          : out    vl_logic;
        ready5          : out    vl_logic;
        ready6          : out    vl_logic;
        ready7          : out    vl_logic;
        ready8          : out    vl_logic;
        ready9          : out    vl_logic;
        ready10         : out    vl_logic;
        max_index       : out    vl_logic_vector(4 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INPUT_COUNT : constant is 1;
    attribute mti_svvh_generic_type of H_NODE_NUMBER : constant is 1;
    attribute mti_svvh_generic_type of O_NODE_NUMBER : constant is 1;
end Datapath;
