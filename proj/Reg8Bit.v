`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:13 05/26/2015 
// Design Name: 
// Module Name:    Reg8Bit 
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
module Reg8Bit(
	input [7:0] D,
	input [7:0] BS,
    input CLK,
    input CLR,
    input En
	 
    );
	   reg[7:0] tempQ;

  always @(posedge CLK)
  begin
    if (En)
    begin
      if (CLR)
        tempQ = 8'b00000000;
      else
        tempQ = BS;
    end
  end
assign D = tempQ;


endmodule
