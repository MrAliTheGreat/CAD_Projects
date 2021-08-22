library verilog;
use verilog.vl_types.all;
entity DataMem is
    port(
        dataGroupNumber : in     vl_logic_vector(10 downto 0);
        data            : out    vl_logic_vector(4 downto 0)
    );
end DataMem;
