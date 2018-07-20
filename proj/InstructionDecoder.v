`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:31 05/26/2015 
// Design Name: 
// Module Name:    InstructionDecoder 
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
module InstructionDecoder(
	 input [3:0] I,
    output reg CLR,
    output reg En1,
    output reg En2,
    output reg En3,
    output reg S0,
    output reg S1,
    output S2,
    output S3
    );
	 reg tempCLR,
    tempEn1,
    tempEn2,
    tempEn3,
    tempS0,
    tempS1,
    tempS2,
    tempS3;
	 
	 always @(I)
	 begin
	 
		if(I==4'b0000)
		begin 
			tempCLR = 1;
			 tempEn1=1;
			 tempEn2=1;
			 tempEn3=1;	
			CLR = 1;
		end
		else if (I==4'b0001)
		begin
			tempCLR = 0;
			 tempEn1=1;
			 tempEn2=0;
			 tempEn3=0;	
		end
			else if (I==4'b0010)
		begin
			tempCLR = 0;
			 tempEn1=0;
			 tempEn2=1;
			 tempEn3=0;
			 tempS0 = 0;
		end
	 	else if (I==4'b0011)
		begin
			tempCLR = 0;
			 tempEn1=0;
			 tempEn2=1;
			 tempEn3=0;
			 tempS0 = 1;
		end
		else if (I==4'b0100)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=0;
			tempS2=0;
			tempS3=0;
		end
		else if (I==4'b0101)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=0;
			tempS2=0;
			tempS3=1;
		end
		else if (I==4'b0110)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=0;
			tempS2=1;
			tempS3=0;
		end
		else if (I==4'b0111)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=0;
			tempS2=1;
			tempS3=1;
		end
		else if (I==4'b1000)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=1;
			tempS2=0;
			tempS3=0;
		end
	 else if (I==4'b1001)
		begin
			tempCLR = 0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=1;
			tempS1=1;
			tempS2=0;
			tempS3=1;
		end
	else
		begin
			tempCLR=0;
			tempEn1=0;
			tempEn2=0;
			tempEn3=0;
		
		end
	 end/*
	assign CLR = tempCLR;
	assign En1 = tempEn1;
	assign En2 = tempEn2;
	assign En3 = tempEn3;
	assign S0 = tempS0;
	assign S1 = tempS1;
	assign S2 = tempS2;
	assign S3 = tempS3;
*/
endmodule
