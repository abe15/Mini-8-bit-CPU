`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:03 05/26/2015 
// Design Name: 
// Module Name:    miniCPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module miniCPU(
	input [11:0] In,
	input Clock,
	output [7:0] Out,
	output Overflow,
	output [7:0] r1,
	output [7:0] r2,
	output [3:0] BS1,
	output [7:0] BS2

    );
	 wire CLR,En1,En2,En3,S0,S1,S2,S3;
	 wire [7:0]Addition;
	 wire[7:0]MultiplyByTwo;
    wire [7:0]DivideByTwo;
    wire[7:0]And;
    wire[7:0]Or;
    wire[7:0]Compare;
    wire AdditionOverflow;
    wire MultiplyByTwoOverflow;
	 wire [7:0] tempBS;
	 wire [7:0] tempOut;
	 BusSplit s0(.A(In),.y1(BS2),.y2(BS1));
	 InstructionDecoder s1(.I(BS1),.CLR(CLR),.En1(En1)
								,.En2(En2),.En3(En3),.S0(S0),.S1(S1),.S2(S2),.S3(S3));
	 
	 Reg8Bit s2(.D(r1),.BS(BS2),.CLK(Clock),.CLR(CLR),.En(En1));
	 Mux2By1 s6(.A(BS2),.B(Out),.S1(S0),.Y(tempBS));
	 Reg8Bit s3(.D(r2),.BS(tempBS),.CLK(Clock),.CLR(CLR),.En(En2));
	 
	 ALU s4(.R1(r1),.R2(r2),.Addition(Addition),.MultiplyByTwo(MultiplyByTwo)
			,.DivideByTwo(DivideByTwo),.And(And),.Or(Or),.Compare(Compare)
			,.AdditionOverflow(AdditionOverflow),.MultiplyByTwoOverflow(MultiplyByTwoOverflow));
	
	 Mux8To1 s5(.A(Addition),.B(MultiplyByTwo),.C(DivideByTwo)
					,.D(And),.E(Or),.F(Compare),.G(8'b00000000)
					,.H(8'b00000000),.S1(S1),.S2(S2),.S3(S3),.Y(tempOut));
	Reg8Bit s9(.D(Out),.BS(tempOut),.CLK(Clock),.CLR(CLR),.En(En3));				
	
	Mux8To1 s7(.A(8'b00000000),.B(8'b00000000),.C(8'b00000000)
					,.D(8'b00000000),.E(AdditionOverflow),.F(MultiplyByTwoOverflow),.G(8'b00000000)
					,.H(8'b00000000),.S1(BS1[2]),.S2(BS1[1]),.S3(BS1[0]),.Y(Overflow));
	
	
endmodule
