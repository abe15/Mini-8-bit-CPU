`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:29 05/27/2015 
// Design Name: 
// Module Name:    Mux2By1 
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
module Mux2By1(
		input [7:0] A,B,
		input S1,
    output [7:0] Y

    );
	 wire  Sel;
	 assign Sel = S1;
	 reg [7:0] tempY;
	 always@(A,B,Sel) 
			begin 
				case(Sel) 
				1'b0:tempY=A; 
				1'b1:tempY=B; 				
				
				default:;
				endcase 
	end 
	assign Y = tempY;

endmodule
