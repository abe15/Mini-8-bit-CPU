`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:34 04/21/2015 
// Design Name: 
// Module Name:    CLA4Bit 
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
module CLA4Bit(	
	input [3:0] A,B,
   input op,
	output [3:0] S,
	output cout,
	output cout2
	
  
    );
	 wire [3:0] G,P,C;
	 assign G = A & B; 
    assign P = A ^ B; 	 
    assign C[0] = op;	 
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
	 
	 assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | 
							(P[3] & P[2] & P[1] & P[0] & C[0]);
	assign cout2 = C[3];
	assign S = P ^ C;
	

endmodule
