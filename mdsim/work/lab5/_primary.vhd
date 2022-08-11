library verilog;
use verilog.vl_types.all;
entity lab5 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        masw            : in     vl_logic;
        chrtsw          : in     vl_logic;
        lcdrs           : out    vl_logic;
        lcdrw           : out    vl_logic;
        lcden           : out    vl_logic;
        lcddata         : out    vl_logic_vector(7 downto 0);
        rled0           : out    vl_logic;
        gled0           : out    vl_logic;
        yled0           : out    vl_logic;
        hex0            : out    vl_logic_vector(6 downto 0);
        rled1           : out    vl_logic;
        gled1           : out    vl_logic;
        yled1           : out    vl_logic;
        hex1            : out    vl_logic_vector(6 downto 0)
    );
end lab5;
