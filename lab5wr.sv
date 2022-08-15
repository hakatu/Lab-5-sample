///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
// Wrapper cho IO
//
///////////////////////////////////////////////

module lab5wr (
    input CLOCK_50,
    input [0:0] KEY,
    input [1:0] SW, //manual/auto switch
    //change route switch

    output LCD_RS, LCD_RW, LCD_EN, // for LCDs
    output [7:0] LCD_DATA,
    output LCD_ON, LCD_BLON,

    output [35:0] GPIO_0,
    output [19:0] GPIO_1,
    output [6:0] HEX4,HEX7,
    output [17:0] LEDR,
    output [7:0] LEDG
);

///////////////////////////////////////////////
wire rstfix;

assign LCD_ON = 1;
assign LCD_BLON = 1;
assign rstfix = !KEY[0];

wire [6:0] led71;

assign {GPIO_1[1],GPIO_1[3],GPIO_1[5],GPIO_1[7],GPIO_1[0],GPIO_1[2],GPIO_1[4]} = led71;

lab5 ilab5(
    CLOCK_50,
    rstfix,
    SW[0], //manual/auto switch
    SW[1], //change route switch

    LCD_RS, LCD_RW, LCD_EN, // for LCDs
    LCD_DATA,

    LEDR[0],LEDG[0],LEDR[2],// red green yellow 0 
    HEX4, //hex 0

	LEDR[1],LEDG[1],LEDR[4],// red green yellow 1
    HEX7, //double hex 1
    
    LEDR[10]
);

assign GPIO_0[0] = LEDG[0];
assign GPIO_0[2] = LEDR[2];
assign GPIO_0[4] = LEDR[0];

assign GPIO_0[1] = LEDG[1];
assign GPIO_0[3] = LEDR[4];
assign GPIO_0[5] = LEDR[1];

//assign {GPIO_0[35],GPIO_0[33],GPIO_0[31],GPIO_0[29],GPIO_0[34],GPIO_0[32],GPIO_0[30]} = HEX4;
assign {GPIO_0[30],GPIO_0[32],GPIO_0[34],GPIO_0[29],GPIO_0[31],GPIO_0[33],GPIO_0[35]} = HEX7;

endmodule