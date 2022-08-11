library verilog;
use verilog.vl_types.all;
entity secgen is
    generic(
        CLKCONST        : integer := 500
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sec             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLKCONST : constant is 1;
end secgen;
