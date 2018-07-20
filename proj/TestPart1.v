`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:52 04/21/2015
// Design Name:   EightBitRippleAdder
// Module Name:   C:/Users/abraham/Desktop/cse 140L/Lab2/TestPart1.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EightBitRippleAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestPart1;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg op;

	// Outputs
	wire [7:0] sum;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	EightBitRippleAdder uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.sum(sum), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		op = 0;
   //pos + pos,
   //pos + neg
   //neg + pos
   //neg + neg
   //pos - pos,
   //pos - neg
   //neg - pos
   //neg - neg

		// Wait 100 ns for global reset to finish
		
		#100 a=8'b00000001;b=8'b00000001;op=0;
		#100 a=8'b00000001;b=8'b00000001;op=1;
	
		

        
		// Add stimulus here

	end
      
endmodule

