`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:07 05/05/2015 
// Design Name: 
// Module Name:    Vending_Machine 
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
module Vending_Machine(
    input  [7:0] amount, // assume only value 5, 10, 25, 100 will be entered one at a time
	 input  [2:0] selection,
	 input clk,
	 output reg[4:0] change_nickels,
	 output reg[3:0] change_dimes,
	 output reg[1:0] change_quarters,
	 output reg change_dollar,
	 output reg[2:0] item_dispensed
    );
	 //values 
	 reg[6:0] dollar = 7'b1100100;
	 reg[6:0] eighty_five = 7'b1001011;
	 reg[6:0] seventy_five =7'b1001011;
	 reg[6:0] fifty = 7'b0110010;
	 reg[6:0] twenty_five = 7'b0011001;
	 reg[6:0] fifteen = 7'b0001111;
	 reg[6:0] dime = 7'b00001010;
	 reg[6:0] nickel = 7'b00000101;

	 //reg[2:0] selection2;
	// assign selection2	 = selection;
	 wire[7:0] amount2;
	 //wire[7:0] temp;
	 assign amount2= 8'b00000000;
	 
	 reg good = 1'b1;
				 //ramen		//chips		//soda		//candy
	parameter Ramen=5'b00000, Chips=5'b00001, Soda=5'b00010, Candy = 5'b00011,
	//water		//gum				//none	 //cancel request
	Water = 5'b00100, Gum = 5'b00101, Wait=5'b00110, Cancel=5'b00111,
	Wait_Ramen = 5'b01000, Wait_Gum = 5'b01001, Wait_Chips = 5'b01010,
	Wait_Soda = 5'b01011, Wait_Candy = 5'b01100, Wait_Water = 5'b01101,
	Dispense_Ramen = 5'b01110,
	Dispense_Chips= 5'b01111,
	Dispense_Soda= 5'b10000,
	Dispense_Candy= 5'b10001,
	Dispense_Water= 5'b10010,
	Dispense_Gum= 5'b10011,
	Wait = 5'b11111;

	
		always @(posedge clk)
	begin		
	
			amount2 = amount2 + amount;
			
			
			case (selection2)		
				
				Ramen:  if(amount2 - dollar < 0) selection2 <= Wait_Ramen;
						  else selection2 <= Dispense_Ramen;
						  
				Chips:  if(amount2 - eighty_five < 0) selection2 <= None;
							else selection2 <= Dispense_Chips;
							
				Soda:   if(amount2 - seventy_five < 0) selection2 <= None ;
							else selection2 <= Dispense_Soda;
							
				Candy:  if(amount2 - fifty < 0) selection2 <= None ;
						  else selection2 <= Dispense_Candy;
						  
				Water:  if(amount2 - twenty_five < 0) selection2 <= None ;
							else selection2 <= Dispense_Water;
							
				Gum: 	  if(amount2 - fifteen < 0) selection2 <= None ;
							else  selection2 <= Dispense_Gum;
							
				Dispense_Ramen:  item_dispensed <= Ramen;
				
				Wait_Ramen: if(amount2 - dollar < 0) selection2 <= Wait_Ramen;
						  else selection2 <= Dispense_Ramen;
				
				Dispense_Chips: item_dispensed <= Chips;
				
				Wait_Chips: if(amount2 - eighty_five < 0) selection2 <= None;
							else selection2 <= Dispense_Chips;
				
				Dispense_Soda: item_dispensed <= Soda;
				
				Wait_Soda:if(amount2 - seventy_five < 0) selection2 <= None ;
							else selection2 <= Dispense_Soda;
				
				Dispense_Candy: item_dispensed <= Soda;
				Wait_Candy: if(amount2 - fifty < 0) selection2 <= None ;
						  else selection2 <= Dispense_Candy;
						  
				Dispense_Water: item_dispensed <= Water;
				Wait_Water: if(amount2 - twenty_five < 0) selection2 <= None ;
							else selection2 <= Dispense_Water;
				Dispense_Gum: item_dispensed <= Gum;
				Wait_Gum: if(amount2 - fifteen < 0) selection2 <= None ;
							else  selection2 <= Dispense_Gum;
				
				
				
				default: selection2 <= selection;
		 endcase		
	if(item_dispensed != 3'b000)
	begin
	 change_nickels <= 5'b00000;
	 change_dimes <= 4'b0000;
	 change_quarters <= 2'b00;
	 change_dollar <= 1'b0;
	 item_dispensed <= 3'b000;
	 
	 begin	 
		case(selection2)
			Ramen:begin end
								
			Chips:
				begin
					amount2 <= amount2 - eighty_five;
				end
	 
	 
			Soda:
				begin
					amount2 <= amount2 - seventy_five;
				end
				
			Candy:
				begin
					amount2 <= amount2 - fifty;
				end
				
			Water:
				begin
					amount2 <= amount2 - twenty_five;
				end
			Gum:
				begin
					amount2 <= amount2 - fifteen;
				end
			None:
				begin
					
				end
			Cancel:
				begin 
					
				end
			endcase
			//calculate the number of dollars
			if(amount2 - dollar >= 0)
			begin
					dollar <= 1'b1;
					amount2 <= amount2 - dollar;
			end
			//calculate the number of quarters
			good <= 1'b1;
			while( good == 1'b1)
			begin
				if(amount2 - twenty_five >= 0)
				begin
					amount2 <= amount2 -twenty_five;
					change_quarters <= change_quarters + 1;
				end
				else
				begin
					good <= 1'b0;
				end						
			end
			
			//calculate the number of dimes
			 good <= 1'b1;
			while( good == 1'b1)
			begin
				if(amount2 - dime >= 0)
				begin
					amount2 <= amount2 - dime; 
					change_dimes<= change_dimes + 1;
				end
				else
				begin
					good <= 1'b0;
				end						
			end
			//calculate the number of nickels
			good <= 1'b1;
			while( good == 1'b1)
			begin
				if(amount2 - nickel >= 0)
				begin
					amount2 <= amount2 - nickel;
					change_nickels <= change_nickels + 1;
				end
				else
				begin
					good <= 1'b0;
				end						
			end
			end
		 
	 end
	 end
	 


endmodule
