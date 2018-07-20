`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:30 05/26/2015
// Design Name:   miniCPU
// Module Name:   C:/Users/abraham/Desktop/Lab2/MiniCPUTester.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: miniCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MiniCPUTester;

	// Inputs
	reg [11:0] In;
	reg Clock;

	// Outputs
	wire [7:0] Out;
	wire Overflow;
	wire [7:0] r1;
	wire [7:0] r2;
	wire [3:0] BS1;
	wire [7:0] BS2;
	//wire [7:0] aluout1;
	//wire [7:0] muxout;

	// Instantiate the Unit Under Test (UUT)
	miniCPU uut (
		.In(In), 
		.Clock(Clock), 
		.Out(Out), 
		.Overflow(Overflow), 
		.r1(r1), 
		.r2(r2), 
		.BS1(BS1), 
		.BS2(BS2) 
		//.aluout1(aluout1), 
		//.muxout(muxout)
	);

always #5 Clock = !Clock;
initial begin
// Initialize Inputs
In = 0;
Clock = 0;
// ADDS
#12.5;
In = 12'b000110000000; //puts 10000000 into reg 1
#10;
In = 12'b001010000010; //puts 10000010 into reg 2
#10;
In = 12'b010100000001; //Rout = R2<<1 w/ overflow so overflow = 1
#10;
In = 12'b011000000010; //Rout = R2>>1
#10;
In = 12'b011100000001; //Rout = R1&R2 so we should get 10000000
#10;
In = 12'b100010000000; //Rout = R1|R2 so we should get 10000010
#10;
In = 12'b011000000010; //Rout = R2>>1
#10;
#10;
#10;
In = 12'b 001100010101; //Rout goes to R2, so R2 =01000001
#10;
In = 12'b0; //CLEAR EVERYTHING
#10;
#10;
In = 12'b000110000000; //puts 10000000 into reg 1
#10;
In = 12'b001010000010; //puts 10000010 into reg 2
#10;
In = 12'b100100100010; //COMPARATOR, ROUT SHOULD BE -1
#10;
In = 12'b000110000000; //puts 10000000 into reg 1
#10;
In = 12'b001010000000; //puts 10000000 into reg 2
#10;
In = 12'b100100100010; //COMPARATOR, ROUT SHOULD BE 0
#10;
In = 12'b000100100000; //puts 00100000 into reg 1
#10;
In = 12'b001000000000; //puts 00000000 into reg 2
#10;
In = 12'b100100100010; //COMPARATOR, ROUT SHOULD BE 1
#10
In = 12'b001100000000; //store rOut into r2
#10;
In = 12'b000001010101; //clears all registers
#10;
In = 12'b000101010101; //puts 01010101 into reg 1
#10;
In = 12'b001000000001; //puts 00000001 into reg 2
#10;
In = 12'b010011111111; //ADD rOut should have 01010110
#10;
In = 12'b000100000001; //puts 1 into reg 1
#10;
In = 12'b001000000000; //puts 0 into reg 2
#10;
In = 12'b010011111111; //ADD
#10;
In = 12'b000100000100; //puts 4 into reg 1
#10;
In = 12'b001000000001; //puts 00000001 into reg 2
#10;
In = 12'b010011111111; //ADD rOut should have 5
#10 $finish;

end

endmodule
