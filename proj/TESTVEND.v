`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:27 05/14/2015
// Design Name:   Vend
// Module Name:   C:/Users/abraham/Desktop/Lab2/TESTVEND.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TESTVEND;

	// Inputs
	reg [7:0] amount;
	reg [2:0] selection;
	reg clk;

	// Outputs
	wire [4:0] change_nickels;
	wire [3:0] change_dimes;
	wire [1:0] change_quarters;
	wire change_dollar;
	wire [2:0] item_dispensed;
	wire [7:0] next_state;

	// Instantiate the Unit Under Test (UUT)
	Vend uut (
		.amount(amount), 
		.selection(selection), 
		.clk(clk), 
		.change_nickels(change_nickels), 
		.change_dimes(change_dimes), 
		.change_quarters(change_quarters), 
		.change_dollar(change_dollar), 
		.item_dispensed(item_dispensed),
		.next_state(next_state)
	);
initial begin
	clk=1;amount=8'b00000000;selection=3'b000;
					#10
					amount=5;
					selection=6;
					#10
					amount=5;
					selection=6;
					#10
					amount=5;
					selection=5;
					#10
					amount=25;
					selection=6;
					#10
					amount=5;
					selection=6;
					#10
					amount=10;
					selection=6;
					#10
					amount=10;
					selection=6;
					#10
					amount=10;
					selection=3;
					#10
					amount=25;
					selection=4;
					#10
					amount=100;
					selection=0;
					#10
					amount=80;
					selection=4;
					#10

					amount=100;
					selection=1;
					/*#10
					amount=20;
					selection=7; broke it up*/
					#10
					amount=10;
					selection=7;
					#10
					amount=10;
					selection=7;


					/*#10
					amount=20;
					selection=0;*/
					#10
					amount=10;
					selection=0;
					#10
					amount=10;
					selection=0;

					
					#10
					amount=25;
					selection=5;
					#10
					amount=90;
					selection=2;
					#10
					amount=105;
					selection=2; 
					#10
					$finish;

	end
	
	always begin
		#10
		clk = ~clk; // Toggle clock every 2 ticks
	end
      
      
endmodule



