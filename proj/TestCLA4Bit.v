`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:59:37 04/22/2015
// Design Name:   CLA4Bit
// Module Name:   C:/Users/abraham/Desktop/Lab2/TestCLA4Bit.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA4Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestCLA4Bit;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg op;

	// Outputs
	wire [3:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CLA4Bit uut (
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

 
    #10 A=4'b0100;B=4'b0011;op=1'b0;
    #10 A=4'b1101;B=4'b1010;op=1'b0;
    #10 A=4'b1110;B=4'b1001;op=1'b0;
    #10 A=4'b1111;B=4'b1010;op=1'b0;
    end 
 
    initial begin
		$monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b ",A,B,op,S,cout);
    end      	
      
endmodule

