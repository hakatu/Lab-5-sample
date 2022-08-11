library verilog;
use verilog.vl_types.all;
entity afsm is
    generic(
        WAY1            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        WAY2            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        CHR1            : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        CHR2            : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sec             : in     vl_logic;
        rled0           : out    vl_logic;
        gled0           : out    vl_logic;
        yled0           : out    vl_logic;
        hex0n           : out    vl_logic_vector(3 downto 0);
        rled1           : out    vl_logic;
        gled1           : out    vl_logic;
        yled1           : out    vl_logic;
        hex1n           : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WAY1 : constant is 1;
    attribute mti_svvh_generic_type of WAY2 : constant is 1;
    attribute mti_svvh_generic_type of CHR1 : constant is 1;
    attribute mti_svvh_generic_type of CHR2 : constant is 1;
end afsm;
