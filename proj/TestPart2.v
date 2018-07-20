`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:49:46 04/21/2015
// Design Name:   CLA8Bit
// Module Name:   C:/Users/abraham/Desktop/cse 140L/Lab2/TestPart2.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA8Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestPart2;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg op;

	// Outputs
	wire [7:0] S;

	// Instantiate the Unit Under Test (UUT)
	CLA8Bit uut (
		.A(A), 
		.B(B), 
		.op(op), 
		.S(S),
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		op = 0;

		
    // Initialize Inputs
    A = 0;  B = 0;  op = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    A=4'b0001;B=4'b0000;op=1'b0;
    #10 A=8'b00000100;B=8'b00000011;op=1'b0;
    #10 A=8'b00001101;B=8'b00001010;op=1'b0;
    #10 A=8'b00001110;B=8'b00001001;op=1'b0;
    #10 A=8'b00001111;B=8'b00001010;op=1'b0;
    end 
 
    initial begin
		$monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b ",A,B,op,S,cout);
    end      
	 
	
      
endmodule

