`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:58 05/04/2015 
// Design Name: 
// Module Name:    TwoBitCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FourBitCounter(
    input Clock, input Reset, input start,input stop,
    output reg[3:0] Counter_Out,
	 output reg blow_up 
    );
	
	initial Counter_Out = 4'b1111;	
	initial blow_up = 1'b0;
	
	 always @ (posedge Clock)
	 begin : CounterBlock // Block Name
		if (Reset == 1'b1) 
			begin
				Counter_Out = 4'b1111;
			end
		else if (start == 1'b1 && stop == 1'b0 && blow_up==1'b0) 
		begin
			Counter_Out = Counter_Out - 1;
			if(Counter_Out == 4'b0000)
			begin
			blow_up = 1'b1;
			end
				
		end
			
	end
endmodule
