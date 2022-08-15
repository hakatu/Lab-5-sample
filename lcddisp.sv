///////////////////////////////////////////////
// Ho Chi Minh University of Technology
// Faculty of Electrical & Electronics Engineering
// Department of Electronics
// EE1016 - EE1010 : Ky Thuat So
//
// Lab 5 : Thiet ke he thong den giao thong
// Thuc hien giao tiep DE2 - GPIO - Breadboard - ICs/LEDs/LCDs
// module simple lcds
//
///////////////////////////////////////////////

module lcddisp(
  input clk,
  output reg lcd_e, lcd_rs,
  output reg [7:0] data
);
//////////////////////////////////////////////////////
//preset lcd write
integer j = 1;

reg [7:0] Datas [1:27];
		
always @(posedge clk) begin
Datas[1]   =  8'h38;   	//-- control instruction : configure - 2 lines, 5x7 matrix --
Datas[2]   =  8'h0C;   	//-- control instruction : Display on, cursor off --
Datas[3]   =  8'h06;   	//-- control instruction : Increment cursor : shift cursor to right --
Datas[4]   =  8'h01;   	//-- control instruction : clear display screen --
Datas[5]   =  8'h80;   	//-- control instruction : force cursor to begin at first line --

Datas[6]   =  8'h54;   	//-- T --
Datas[7]   =  8'h68;   	//-- h --
Datas[8]   =  8'h69;   	//-- i --
Datas[9]   =  8'h20;   	//--   --
Datas[10]  =  8'h4E;   	//-- N --
Datas[11]  =  8'h67;   	//-- g --
Datas[12]  =  8'h68;   	//-- h --
Datas[13]  =  8'h69;   	//-- i --
Datas[14]  =  8'h65;   	//-- e --
Datas[15]  =  8'h6D;   	//-- m --
Datas[16]  =  8'h20;   	//--   --
Datas[17]  =  8'h35;   	//-- 5 --

Datas[18]   =  8'hC0;   //-- control instruction : force cursor to begin at second line --

Datas[19]  =  8'h42;   	//-- B --
Datas[20]  =  8'h4D;   	//-- M --
Datas[21]  =  8'h44;   	//-- D --
Datas[22]  =  8'h54;   	//-- T --
Datas[23]  =  8'h20;   	//--   --
Datas[24]  =  8'h44;   	//-- D --
Datas[25]  =  8'h48;   	//-- H --
Datas[26]  =  8'h42;   	//-- B --
Datas[27]  =  8'h4B;   	//-- K --
end

///////////////////////////////////////////////////////////
integer i = 0; //

always @(posedge clk) begin

//-- Delay for writing data
	
  if (i <= 1000000) begin
  i = i + 1; lcd_e = 1;
  data = Datas[j];
  end
  
  else if (i > 1000000 & i < 2000000) begin
  i = i + 1; lcd_e = 0;
  end
  
  else if (i == 2000000) begin
  j = j + 1; i = 0;
  end
  else i = 0;
  
 //-- LCD_RS signal should be set to 0 for writing commands and to 1 for writing data

  if (j <= 5 )
    lcd_rs = 0;  
  else if (j > 5 & j< 18)
    lcd_rs = 1;   
  else if (j == 18)
    lcd_rs = 0;
  else if (j > 27) begin 
    lcd_rs = 1;
    j = 5;
    end
  else
   lcd_rs = 1;
  //else if (j > 27) begin 
   // lcd_rs = 1;
  ///  j = 5;
  //end
end
endmodule