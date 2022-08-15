///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
// Module change 50 MHz to 1 sec
//
///////////////////////////////////////////////

module secgen (
    input clk,
    input rst,

    output sec
);

///////////////////////////////////////////////
parameter CLKCONST = 50000000; //clock 50 MHz
///////////////////////////////////////////////

reg [25:0] temp; // 26-bit 67M

wire tmpzr;

assign tmpzr = temp == 0;

always_ff @(posedge clk) begin
    if (rst)
    temp <= CLKCONST; //50M
    else if (tmpzr)
    temp <= CLKCONST;
    else
    temp <= temp - 1;
end

assign sec = tmpzr;

endmodule