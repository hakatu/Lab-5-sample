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

module lab5_tb;

reg clk,rst;
reg masw,chrtsw;

wire lcdrs, lcdrw, lcden;
wire [7:0] lcddata;

wire rled0, gled0, yled0; // red green yellow 0 
wire [6:0] hex0; //hex 0

wire rled1, gled1, yled1; // red green yellow 1
wire [6:0] hex1; //double hex 1

always begin
clk = 0;
#1 clk =1;
#1;
end



lab5 ilab5 (
clk,
rst,
masw, //manual/auto switch
chrtsw, //change route switch

lcdrs, lcdrw, lcden, // for LCDs
lcddata,

rled0, gled0, yled0, // red green yellow 0 
hex0, //hex 0

rled1, gled1, yled1, // red green yellow 1
hex1 //double hex 1
);

initial begin
    rst = 1'b0;
    chrtsw = 1'b1;
    masw = 1'b1;
    #100;
    rst = 1'b1;
    #100;
    rst = 1'b0;
    #200000;
    chrtsw = 1'b0;
    $display("its done, my process is done, rest is you");
end

endmodule