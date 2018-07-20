`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:25:10 04/22/2015
// Design Name:   EightBitRippleAdder
// Module Name:   C:/Users/abraham/Desktop/Lab2/TestPart1next.v
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

module TestPart1next;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg op;

	// Outputs
	wire [7:0] sum;
	wire carry;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	EightBitRippleAdder uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.sum(sum), 
		.carry(carry), 
		.overflow(overflow)
	);

	
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		op = 0;

		// Initialize Inputs
    
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
    
				#10 a=8'b00000001;b=8'b00000001;op=1'b0;//pos + pos
				#10 a=8'b00000010;b=8'b11111110;op=1'b0;//pos + negative				
				#10 a=8'b11111111;b=8'b00000001;op=1'b0;//negative + positive
				#10 a=8'b11111111;b=8'b11111111;op=1'b0; //negative + negative
				#10 a=8'b00011001;b=8'b10110001;op=1'b1; //positive - negative
				#10 a=8'b00111101;b=8'b00110101;op=1'b1; //positive - positive					
				#10 a=8'b10000111;b=8'b00000111;op=1'b1;//negative - postive
				#10 a=8'b10100111;b=8'b10010111;op=1'b1;//negative - negative
				#10 a=8'b10000001;b=8'b10000001;op=1'b0;//overflow negative + negative
				#10 a=8'b01111111;b=8'b00011111;op=1'b0;//overflow positive + positve
    end 
 
    initial begin
					
		$monitor("time=",$time, " A=%b Operation: %b :  B=%b  : Sum=%b : Cout=%b ",a,op,b,sum,carry);
		
    end       
	

	
      
endmodule

