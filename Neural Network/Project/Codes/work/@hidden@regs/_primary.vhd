library verilog;
use verilog.vl_types.all;
entity HiddenRegs is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld1             : in     vl_logic;
        ld2             : in     vl_logic;
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        in3             : in     vl_logic_vector(7 downto 0);
        in4             : in     vl_logic_vector(7 downto 0);
        in5             : in     vl_logic_vector(7 downto 0);
        in6             : in     vl_logic_vector(7 downto 0);
        in7             : in     vl_logic_vector(7 downto 0);
        in8             : in     vl_logic_vector(7 downto 0);
        in9             : in     vl_logic_vector(7 downto 0);
        in10            : in     vl_logic_vector(7 downto 0);
        in11            : in     vl_logic_vector(7 downto 0);
        in12            : in     vl_logic_vector(7 downto 0);
        in13            : in     vl_logic_vector(7 downto 0);
        in14            : in     vl_logic_vector(7 downto 0);
        in15            : in     vl_logic_vector(7 downto 0);
        in16            : in     vl_logic_vector(7 downto 0);
        in17            : in     vl_logic_vector(7 downto 0);
        in18            : in     vl_logic_vector(7 downto 0);
        in19            : in     vl_logic_vector(7 downto 0);
        in20            : in     vl_logic_vector(7 downto 0);
        out_concat      : out    vl_logic_vector(159 downto 0)
    );
end HiddenRegs;
