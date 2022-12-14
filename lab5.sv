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

module lab5 (
    input clk,
    input rst,
    input masw, //manual/auto switch
    input chrtsw, //change route switch

    output lcdrs, lcdrw, lcden, // for LCDs
    output [7:0] lcddata,

    output rled0, gled0, yled0, // red green yellow 0 
    output [6:0] hex0, //hex 0

    output rled1, gled1, yled1, // red green yellow 1
    output [6:0] hex1, //double hex 1
    output [3:0] hex1nmo,

	output sectest
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

wire sec;
wire [3:0] hex0na,hex1na;

afsm iafsm (
    clk,
    rst,
	sec,
	
    rled0a, gled0a, yled0a, // red green yellow 0 
    hex0na, //hex 0

    rled1a, gled1a, yled1a, // red green yellow 1
    hex1na //double hex 1
);

/////

wire [3:0] hex0nm;
wire [3:0] hex1nm;

assign hex1nmo = hex1nm;

mfsm imfsm (
    clk,
    rst,
    sec,
    chrtsw,//change switch

    rled0m, gled0m, yled0m, // red green yellow 0 
    hex0nm, //hex 0

    rled1m, gled1m, yled1m, // red green yellow 1
    hex1nm //double hex 1
);

//// bcd convert to 7 segs

bcdcnv ibcdcnv1 (hex0na,hex0a);
bcdcnv ibcdcnv2 (hex1na,hex1a);
bcdcnv ibcdcnv3 (hex0nm,hex0m);
bcdcnv ibcdcnv4 (hex1nm,hex1m);

//// second generator

secgen isecgen (clk,rst,sec);

assign sectest = sec;
///////////////////////////////////////////////
endmodule