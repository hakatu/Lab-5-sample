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

    output [19:0] GPIO_0
);

///////////////////////////////////////////////

assign LCD_ON = 1;
assign LCD_BLON = 1;

lab5 ilab5(
    CLOCK_50,
    KEY[0],
    SW[0], //manual/auto switch
    SW[1], //change route switch

    LCD_RS, LCD_RW, LCD_EN, // for LCDs
    LCD_DATA,

    GPIO_0[0],GPIO_0[1],GPIO_0[2],// red green yellow 0 
    GPIO_0[9:3], //hex 0

    GPIO_0[10],GPIO_0[11],GPIO_0[12], // red green yellow 1
    GPIO_0[19:13] //double hex 1
);

endmodule