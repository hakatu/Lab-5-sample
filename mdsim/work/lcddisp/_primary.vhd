library verilog;
use verilog.vl_types.all;
entity lcddisp is
    port(
        clk             : in     vl_logic;
        lcd_e           : out    vl_logic;
        lcd_rs          : out    vl_logic;
        data            : out    vl_logic_vector(7 downto 0)
    );
end lcddisp;
