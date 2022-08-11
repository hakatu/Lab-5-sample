library verilog;
use verilog.vl_types.all;
entity bcdcnv is
    port(
        nmber           : in     vl_logic_vector(3 downto 0);
        svnseg          : out    vl_logic_vector(6 downto 0)
    );
end bcdcnv;
