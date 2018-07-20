`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:12 05/26/2015 
// Design Name: 
// Module Name:    Mux8To1 
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
module Mux8To1(
		input [7:0] A,B,C,D,E,F,G,H,
		input S1,S2,S3,
    output [7:0] Y

    );
	 wire [3:0] Sel;
	 assign Sel = {S1, S2,S3};
	 reg [7:0] tempY;
	 always@(A,B,C,D,E,F,G,H,Sel) 
			begin 
				case(Sel) 
				3'b000:tempY=A; 
				3'b001:tempY=B; 
				3'b010:tempY=C; 
				3'b011:tempY=D; 
				3'b100:tempY=E; 
				3'b101:tempY=F; 
				3'b110:tempY=G; 
				3'b111:tempY=H; 
				default:;
				endcase 
	end 
	assign Y = tempY;



endmodule
