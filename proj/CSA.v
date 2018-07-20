`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:15 04/22/2015 
// Design Name: 
// Module Name:    CSA 
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
module CSA(
	input [7:0] A,B,
   input cin,
	output [7:0] S,
	output cout,
	output overflow
  
    );
	wire [3:0] 	S0;   
   wire [3:0] 	S1;
	wire [7:0] b;
	xor(b[0], B[0], cin);
	xor(b[1], B[1], cin);
	xor(b[2], B[2], cin);
	xor(b[3], B[3], cin);
	xor(b[4], B[4], cin);
	xor(b[5], B[5], cin);
	xor(b[6], B[6], cin);
	xor(b[7], B[7], cin);
   xor(overflow,COUT2,dontcare3);
	CLA4Bit s0( .A( A[3:0] ), .B(b[3:0]), .op( cin ), .S( S[3:0] ), .cout( COUT0 ),.cout2(dontcare) );
	CLA4Bit s1( .A( A[7:4] ), .B(b[7:4]), .op( 1'b0 ), .S( S0 ), .cout( COUT1 ),.cout2(dontcare2) );
	CLA4Bit s2( .A( A[7:4] ), .B(b[7:4]), .op( 1'b1 ), .S( S1 ), .cout( COUT2 ),.cout2(dontcare3));
	
	
	//four 2x1 mutiplexors for S7-S4
	 multiplexer s3(.X(S[4]), .S0(S0[0]), .S1(S1[0]), .S(COUT0));  // COUT 
	 multiplexer s4(.X(S[5]), .S0(S0[1]), .S1(S1[1]), .S(COUT0));  // COUT 
	 multiplexer s5(.X(S[6]), .S0(S0[2]), .S1(S1[2]), .S(COUT0));  // COUT 
	 multiplexer s6(.X(S[7]), .S0(S0[3]), .S1(S1[3]), .S(COUT0));  // COUT 

	 multiplexer s7(.X(cout), .S0(COUT1), .S1(COUT2), .S(COUT0));  // COUT 
	 
	 
   
endmodule
