`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:43:33 05/05/2015
// Design Name:   Count_Up_Switcher
// Module Name:   C:/Users/abraham/Desktop/Lab2/Tes_Part2.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Count_Up_Switcher
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tes_Part2;

	// Inputs
	reg control;
	reg clk;
	// Outputs
	wire odd_flag;
	wire [2:0] count;

	// Instantiate the Unit Under Test (UUT)
	Count_Up_Switcher uut (
		.clk(clk),
		.control(control), 
		.odd_flag(odd_flag),
		.count(count)
		
	);

initial begin
		clk= 1; control = 1;

		#30 control = 0;
		#30 control = 1;
		#10 control = 0;
		#10 control =1;
		#10 control = 0;
		#10 $finish;
		
	end
	
	always begin
		#2
		clk = ~clk; // Toggle clock every 2 ticks
	end
      
endmodule

