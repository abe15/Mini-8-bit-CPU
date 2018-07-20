`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:32 05/05/2015 
// Design Name: 
// Module Name:    Count_Up_Switcher 
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
module Count_Up_Switcher(
	input clk,
    input control,
    output reg odd_flag,
	 output reg [2:0] count
    );

	reg[2:0] state;
	
	
	parameter S0=3'b000, S1=3'b001, S2=3'b010, S3 = 3'b011,
	S4 = 3'b100, S5 = 3'b101, S6=3'b110, S7=3'b111;

	always @(posedge clk)
	begin		
			case (state)
				S0: state <= S1;
				S1:  state <= (control == 1'b0) ? S2 : S3;
				S2: state <= (control == 1'b0) ? S3 : S6;
				S3: state <= (control == 1'b0) ? S4 : S2;
				S4: state <= (control == 1'b0) ? S5 : S0;
				S5: state <= (control == 1'b0) ? S6 : S4;
				S6: state <= S7;
				S7: state <= (control == 1'b0) ? S0 : S5;
				default: state <= S0;
		 endcase
		 if( (state & 3'b001) == 1'b1) begin
			odd_flag <=1'b1;
			end
			else begin
			odd_flag <= 1'b0;
			end
		 count <= state;
	 end

endmodule
