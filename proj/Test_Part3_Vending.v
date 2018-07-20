`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:11 05/05/2015
// Design Name:   Vending_Machine
// Module Name:   C:/Users/abraham/Desktop/Lab2/Test_Part3_Vending.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vending_Machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Part3_Vending;

	// Inputs
	reg amount;
	reg selection[2:0];
	reg clk;
	//Outputs
	
	reg change_nickels[4:0];
	reg change_dimes [3:0];
	reg change_quarters[1:0];
	reg change_dollar;
	reg item_dispensed[2:0]; 

	// Instantiate the Unit Under Test (UUT)
	Vending_Machine uut (
		.amount(amount),
		.selection(selection),
		.clk(clk),
		.change_nickels(change_nickels),
		.change_dimes(change_dimes),
		.change_quarters(change_quarters),
		.change_dollar(change_dollar),
		.item_dispensed(item_dispensed)
	);

	initial begin
	clk=1;amount=0;selection=0;
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
					#10
					amount=20;
					selection=7;
					#10
					amount=20;
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

	end
	
	always begin
		#5
		clk = ~clk; // Toggle clock every 2 ticks
	end
      
      
endmodule

