`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:20:20 04/21/2015
// Design Name:   CLA8BitWith2FourBit
// Module Name:   C:/Users/abraham/Desktop/cse 140L/Lab2/TestPart2With4Bit.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA8BitWith2FourBit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestPart2With4Bit;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg op;

	// Outputs
	wire [7:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	CLA8BitWith2FourBit uut (
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
    
				#10 A=8'b00000001;B=8'b00000001;op=1'b1;
				#10 A=8'b00000010;B=8'b00000011;op=1'b0;
				#10 A=8'b10000001;B=8'b10000001;op=1'b0;
				#10 A=8'b00011001;B=8'b00110001;op=1'b0;
				#10 A=8'b00000011;B=8'b00000011;op=1'b1;
				#10 A=8'b11111111;B=8'b00000001;op=1'b0;
				#10 A=8'b11111111;B=8'b00000000;op=1'b1;
				#10 A=8'b11111111;B=8'b11111111;op=1'b0;
				#10 $stop;
    end 
 
    initial begin
		$monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b ",A,B,op,S,cout);
    end      
	
      
endmodule

