`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:23 05/26/2015 
// Design Name: 
// Module Name:    Adder 
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
module Adder(
    input [7:0]A,
    input [7:0]B,
    output [7:0] Sum,
    output Overflow
    );

	reg[8:0] tempSum;
	reg tempOv;

	always @(A or B)
	  begin
		 tempSum = A + B;
		 tempOv = tempSum[8];
	  end

  assign Sum = tempSum;
  assign Overflow = tempOv;




endmodule
