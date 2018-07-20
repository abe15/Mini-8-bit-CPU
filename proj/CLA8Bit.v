`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:35 04/21/2015 
// Design Name: 
// Module Name:    CLA8Bit 
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
module CLA8Bit(
	input [7:0] A,B,
   input op,
	output [7:0] S,
	output cout
  
    );
	 wire [7:0] G,P,C;
	 assign G = A & B; 
    assign P = A ^ B; 	 
    assign C[0] = op;	 
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
	 assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | 
						(P[3] & P[2] & P[1] & P[0] & C[0]) ;
	 assign C[5] = G[4] | (P[4] & G[3]) | (P[4] & P[3] & G[2]) | (P[4] & P[3] & P[2] & G[1]) | (P[4] & P[3] & P[2] & P[1] & G[0]) | 
						(P[4] & P[3] & P[2] & P[1] & P[0] & C[0]) ;
	 assign C[6] = G[5] | (P[5] & G[4]) | (P[5] & P[4] & G[3]) | (P[5] & P[4] & P[3] & G[2]) | (P[5] & P[4] & P[3] & P[2] & G[1]) | (P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | 
						(P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & C[0]) ;
	 assign C[7] = G[6] | (P[6] & G[5]) | (P[6] & P[5] & G[4]) | (P[6] & P[5] & P[4] & G[3]) | 
						(P[6] & P[5] & P[4] & P[3] & G[2]) | (P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | 
						(P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | 
						(P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & C[0]) ;
	 assign cout = G[7] | (P[7] & G[6]) | (P[7] & P[6] & G[5]) | (P[7] & P[6] & P[5] & G[4]) | (P[7] & P[6] & P[5] & P[4] & G[3]) | 
						(P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | 
						(P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | 
						(P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & C[0]) ;

	assign S = P ^ C;
endmodule
