`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:37 04/21/2015 
// Design Name: 
// Module Name:    CLA8BitWith2FourBit 
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
module CLA8BitWith2FourBit(
	input [7:0] A,B,
   input op,
	output [7:0] S,
	output cout
  
    );
	 
	 
   
	CLA4Bit s0( .A( A[3:0] ), .B(B[3:0]), .op( op ), .S( S[3:0] ), .cout( ripple0 ) );
	CLA4Bit s1( .A( A[7:4] ), .B(B[7:4]), .op( ripple0 ), .S( S[7:4]), .cout( cout ) );
	 
	

endmodule
