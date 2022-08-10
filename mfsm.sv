///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
// Manual FSM
//
///////////////////////////////////////////////

module lab5 #(
    parameter NULL = 0;
) (
    input clk,
    input rst,

    input chrtsw,

    output rled0, gled0, yled0, // red green yellow 0 
    output [6:0] hex0, //hex 0

    output rled1, gled1, yled1, // red green yellow 1
    output [6:0] hex1 //double hex 1
);

///////////////////////////////////////////////

parameter WAY1 = 2'b00; //4 states FSM with gray code JFF
parameter WAY2 = 2'b01;
parameter CHR1 = 2'b11;
parameter CHR2 = 2'b10;


///////////////////////////////////////////////
//main fsm//

reg [1:0] state;

wire stateisway1;

assign stateisway1 = state == WAY1;

wire stateisway2;

assign stateisway2 = state == WAY2;

wire stateischr1;

assign stateischr1 = state == CHR1;

wire stateischr2;

assign stateischr2 = state == CHR2;

always_ff @(posedge clk) begin
    if(rst)
    state <= chrtsw? WAY1 : WAY2;
    else
        if(stateisway1)
        state <= chrtsw? WAY1 : CHR1;
        else if(stateischr1)
        state <= chr1done? WAY2 : CHR1;       
        else if(stateisway2)
        state <= chrtsw? CHR2 : WAY1; 
        else if(stateisch2)
        state <= chr2done? WAY1 : CHR2;
        else
        state <= state; 
end

////////////////////////////////////////////////
wire [3:0] hex0n,hex1n; //for number to count
//3-sec down cnt
reg [2:0] cntdwn;//count down timer

always_ff @(posedge clock ) begin
    if(rst)
    cntdwn <= 3;
    else
    cntdo
end

////////////////////////////////////////////////
//output logic
//way 1

assign gled0 = stateisway1; //green lit when way1 is going
assign rled0 = stateisway2 | stateisch2; //red lit when way2 is going or changing to way 1
assign yled0 = stateischr1; //yellow lit when changing to way 2

assign hex0n = stateisway1? 4'd9 : cntdwn; // number 9 or 3 sec down
