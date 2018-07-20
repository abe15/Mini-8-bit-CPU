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
	output cout,
	output overflow
  
    );
	 wire [7:0] b;
	 xor(b[0], B[0], op);
	xor(b[1], B[1], op);
	xor(b[2], B[2], op);
	xor(b[3], B[3], op);
	xor(b[4], B[4], op);
	xor(b[5], B[5], op);
	xor(b[6], B[6], op);
	xor(b[7], B[7], op);
	 
	xor(overflow,second_to_last,cout);
   
	CLA4Bit s0( .A( A[3:0] ), .B(b[3:0]), .op( op ), .S( S[3:0] ), .cout( ripple0 ),.cout2(dontcare) );
	CLA4Bit s1( .A( A[7:4] ), .B(b[7:4]), .op( ripple0 ), .S( S[7:4]), .cout( cout ),.cout2(second_to_last) );
	 
	

endmodule
