`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:21:55 05/04/2015
// Design Name:   FourBitCounter
// Module Name:   C:/Users/abraham/Desktop/Lab2/FourBitTester_PART_1.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourBitCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FourBitTester_PART_1;

	// Inputs
	reg Clock;
	reg Reset;
	reg En;

	// Outputs
	wire [3:0] Counter_Out;
	wire [0] blow_up;

	// Instantiate the Unit Under Test (UUT)
	FourBitCounter uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.En(En), 
		.Counter_Out(Counter_Out),
		.blow_up(blow_up)
	);

initial begin
		Clock = 1; Reset = 0; En = 0;

		#5		Reset = 1;
		#10		Reset = 0;
		#10		En = 1;
		#100	En = 0;
		#5		$finish;
	end
	
	always begin
		#2
		Clock = ~Clock; // Toggle clock every 2 ticks
	end
      
endmodule


