///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
//
//
///////////////////////////////////////////////

module lab5 #(
    parameter NULL = 0;
) (
    input clk,
    input rst,
    input masw, //manual/auto switch
    input chrtsw, //change route switch

    output lcdrs, lcdrw, lcden, // for LCDs
    output [7:0] lcddata,

    output rled0, gled0, yled0, // red green yellow 0 
    output [6:0] hex0, //hex 0

    output rled1, gled1, yled1, // red green yellow 1
    output [6:0] hex1 //double hex 1
);

///////////////////////////////////////////

//LCD control//////////////////////////////

lcddisp ilcddisp (clk,lcden,lcdrs,lcddata);

assign lcdrw = 0;
////////////////////////////////////////

////manual/auto mechanism////
wire rled0a, rled0m;

assign rled0 = masw? rled0a : rled0m;

wire gled0a, gled0m;

assign gled0 = masw? gled0a : gled0m;

wire yled0a, yled0m;

assign yled0 = masw? yled0a : yled0m;

wire [6:0] hex0a, hex0m;

assign hex0 = masw? hex0a : hex0m;

wire rled1a, rled1m;

assign rled1 = masw? rled1a : rled1m;

wire gled1a, gled1m;

assign gled1 = masw? gled1a : gled1m;

wire yled1a, yled1m;

assign yled1 = masw? yled1a : yled1m;

wire [6:0] hex1a, hex1m;

assign hex1 = masw? hex1a : hex1m;

////////////////////////////////////////

///////////////////////////////////////////////
endmodule