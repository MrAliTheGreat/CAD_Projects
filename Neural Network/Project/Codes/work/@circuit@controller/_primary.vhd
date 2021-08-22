library verilog;
use verilog.vl_types.all;
entity CircuitController is
    port(
        clk             : in     vl_logic;
        start_circuit   : in     vl_logic;
        ready1          : in     vl_logic;
        ready2          : in     vl_logic;
        ready3          : in     vl_logic;
        ready4          : in     vl_logic;
        ready5          : in     vl_logic;
        ready6          : in     vl_logic;
        ready7          : in     vl_logic;
        ready8          : in     vl_logic;
        ready9          : in     vl_logic;
        ready10         : in     vl_logic;
        rst_hidden_regs : out    vl_logic;
        start_neurons   : out    vl_logic;
        ld_regs1        : out    vl_logic;
        ld_regs2        : out    vl_logic;
        ready_circuit   : out    vl_logic;
        enMax           : out    vl_logic;
        ctrl_w_b_data_neuron: out    vl_logic_vector(1 downto 0)
    );
end CircuitController;
