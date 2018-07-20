`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:07 04/22/2015 
// Design Name: 
// Module Name:    multiplexer 
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
module multiplexer(  
    

   output  X,  // The output line

   input   S1, 
   input   S0,  
   input   S  // Selection bit
	);
   
   assign X = (S == 1'b0) ? S0 : S1;
endmodule
