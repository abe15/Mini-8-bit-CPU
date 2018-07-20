`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:27 05/26/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0]R1,
    input [7:0]R2,
    output [7:0]Addition,
    output [7:0]MultiplyByTwo,
    output [7:0]DivideByTwo,
    output [7:0]And,
    output [7:0]Or,
    output [7:0]Compare,
    output AdditionOverflow,
    output MultiplyByTwoOverflow
    );
	 
	 Adder s0( .A(R1), .B(R2), .Sum(Addition),.Overflow(AdditionOverflow));
	 ShiftLeft s1(.A(R2),.Y(MultiplyByTwo),.Overflow(MultiplyByTwoOverflow));
	 ShiftRight s2(.A(R2),.Y(DivideByTwo));
	 assign And = R1&R2;
	 assign Or = R1|R2;
	 Comparator s3(.A(R1),.B(R2),.comparison_result(Compare));

endmodule
