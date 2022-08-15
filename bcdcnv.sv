///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
// bcd to led 7 doan
//
///////////////////////////////////////////////

module bcdcnv(
    input [3:0] nmber,
    output [6:0] svnseg
);

///////////////////////////////////////////////

reg [6:0] seg;

always @(nmber)
    begin
        case (nmber) //case statement
            0 : seg = 7'b1000000;
            1 : seg = 7'b1111001;
            2 : seg = 7'b0100100;
            3 : seg = 7'b0110000;
            4 : seg = 7'b0011001;
            5 : seg = 7'b0010010;
            6 : seg = 7'b0100000;
            7 : seg = 7'b1111000;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0010000;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seg = 7'b1111111; 
        endcase
    end

assign svnseg = seg;

endmodule