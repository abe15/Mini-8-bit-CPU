`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:54 04/21/2015 
// Design Name: 
// Module Name:    EightBitRippleAdder 
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
module EightBitRippleAdder(
    input  [7:0] a,
    input [7:0] b,
    input op,
    output [7:0] sum,
	 output carry,
    output overflow
    );
	xor(b0, b[0], op);
	xor(b1, b[1], op);
	xor(b2, b[2], op);
	xor(b3, b[3], op);
	xor(b4, b[4], op);
	xor(b5, b[5], op);
	xor(b6, b[6], op);
	xor(b7, b[7], op);
	xor(overflow, ripple6, carry);     

	FullAdder s0( .a( a[0] ), .b(b0), .cin( op ), .sum( sum[0]), .cout( ripple0 ) );
	FullAdder s1( .a( a[1] ), .b(b1), .cin( ripple0 ), .sum( sum[1]), .cout( ripple1 ) );
	FullAdder s2( .a( a[2] ), .b(b2), .cin( ripple1 ), .sum( sum[2]), .cout( ripple2 ) );
	FullAdder s3( .a( a[3] ), .b(b3), .cin( ripple2 ), .sum( sum[3]), .cout( ripple3) );
	FullAdder s4( .a( a[4] ), .b(b4), .cin( ripple3), .sum( sum[4]), .cout( ripple4 ) );
	FullAdder s5( .a( a[5] ), .b(b5), .cin( ripple4 ), .sum( sum[5]), .cout( ripple5 ) );
	FullAdder s6( .a( a[6] ), .b(b6), .cin( ripple5 ), .sum( sum[6]), .cout( ripple6 ) );
	FullAdder s7( .a( a[7] ), .b(b7), .cin( ripple6 ), .sum( sum[7]), .cout( carry ) );		


endmodule
