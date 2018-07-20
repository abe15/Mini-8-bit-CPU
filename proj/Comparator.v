`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:09 05/26/2015 
// Design Name: 
// Module Name:    Comparator 
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
module Comparator(
    input [7:0]A,
    input [7:0]B,
    output [7:0]comparison_result
    );

	reg[7:0] tempY;

  always @(A or B)
  begin
    if (A == B)
      tempY = 8'b0000000;
    else if (A > B)
      tempY = 8'b00000001;
    else
      tempY = 8'b11111111;
  end
  assign comparison_result = tempY; 

endmodule
