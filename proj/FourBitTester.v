`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:32:43 05/04/2015
// Design Name:   FourBitCounter
// Module Name:   C:/Users/abraham/Desktop/Lab2/FourBitTester.v
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

module FourBitTester;

	// Inputs
	reg Clock;
	reg Reset;
	reg start;
	reg stop;

	// Outputs
	wire [3:0] Counter_Out;
	wire blow_up;

	// Instantiate the Unit Under Test (UUT)
	FourBitCounter uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.start(start),
		 .stop(stop),
		.Counter_Out(Counter_Out), 
		.blow_up(blow_up)
	);


initial begin
		Clock = 1; Reset = 0; start=0;stop=1;

		#20 start=1; stop=0;
		#30 start=0;stop=1;
		#5  Reset=1;
		#5 Reset=0;start=1;stop=0;
		#60 $finish;
	end
	
	always begin
		#2
		Clock = ~Clock; // Toggle clock every 2 ticks
	end
      
endmodule



