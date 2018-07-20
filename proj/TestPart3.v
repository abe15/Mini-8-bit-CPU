`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:35:08 04/22/2015
// Design Name:   CSA
// Module Name:   C:/Users/abraham/Desktop/Lab2/TestPart3.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CSA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestPart3;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg cin;

	// Outputs
	wire [7:0] S;
	wire cout;
	wire overflow;
	// Instantiate the Unit Under Test (UUT)
	CSA uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.cout(cout),
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

 // Add stimulus here
    
				#10 A=8'b00000001;B=8'b00000001;cin=1'b0;//pos + pos
				#10 A=8'b00000010;B=8'b11111110;cin=1'b0;//pos + negative				
				#10 A=8'b11111111;B=8'b00000001;cin=1'b0;//negative + positive
				#10 A=8'b11111111;B=8'b11111111;cin=1'b0; //negative + negative
				#10 A=8'b00011001;B=8'b10110001;cin=1'b1; //positive - negative
				#10 A=8'b00111101;B=8'b00110101;cin=1'b1; //positive - positive					
				#10 A=8'b10000111;B=8'b00000111;cin=1'b1;//negative - postive
				#10 A=8'b10100111;B=8'b10010111;cin=1'b1;//negative - negative
				#10 A=8'b10000001;B=8'b10000001;cin=1'b0;//overflow negative + negative
				#10 A=8'b01111111;B=8'b00011111;cin=1'b0;//overflow positive + positve
    end 
 
    initial begin
					
		$monitor("time=",$time, " A=%b Operation: %b :  B=%b  : Sum=%b : Cout=%b ",A,cin,B,S,cout);
		
    end    
	
      
endmodule

