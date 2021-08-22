library verilog;
use verilog.vl_types.all;
entity ArgMax is
    port(
        enMax           : in     vl_logic;
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
        dataGroupNumber : in     vl_logic_vector(10 downto 0);
        max_index       : out    vl_logic_vector(4 downto 0)
    );
end ArgMax;
