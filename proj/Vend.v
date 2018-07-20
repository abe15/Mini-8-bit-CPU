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
module Vend(
    input  [7:0] amount, // assume only value 5, 10, 25, 100 will be entered one at a time
	 input  [2:0] selection,
	 input clk,
	 output reg[4:0] change_nickels,
	 output reg[3:0] change_dimes,
	 output reg[1:0] change_quarters,
	 output reg change_dollar,
	 output reg[2:0] item_dispensed,
	 output reg [7:0] next_state
    );
	 //values 
	 reg[6:0] DOLLAR = 7'b1100100;	 
	 reg[6:0] QUARTER = 7'b0011001;	
	 reg[6:0] DIME = 7'b00001010;
	 reg[6:0] NICKLE = 7'b00000101;

    
	 

	 parameter [7:0] FIVE = 8'b00000101;
	 parameter [7:0] TEN = 8'b00001010;
	 parameter [7:0] FIFTEEN = 8'b00001111;
	 parameter [7:0] TWENTY = 8'b00010100;
	 parameter[7:0] TWENTYFIVE = 8'b00011001;
	 parameter[7:0] THIRTY = 8'b00011110;
	 parameter [7:0] THIRTYFIVE = 8'b00100011;
	 parameter [7:0] FORTY = 8'b00101000;
	 parameter [7:0] FORTYFIVE = 8'b00101101;
	 parameter [7:0] FIFTY = 8'b00110010;
	 parameter[7:0] FIFTYFIVE = 8'b00110111;
	 parameter [7:0] SIXTY = 8'b00111100;///////
	 parameter[7:0] SIXTYFIVE = 8'b01000001;
	 parameter [7:0] SEVENTY = 8'b01000110;
	 parameter [7:0] SEVENTYFIVE = 8'b01001011;
	 parameter [7:0] EIGHTY = 8'b01010000;
	 parameter[7:0] EIGHTYFIVE = 8'b01010101;
	 parameter [7:0] NINETY = 8'b01011010;
	 parameter [7:0] NINETYFIVE = 8'b01011111;
	 parameter [7:0] ONEHUNDRED = 8'b01100100;
	 parameter [7:0] IDLE = 8'b00000000;
	initial next_state = IDLE;
	parameter RAMEN = 3'b000, CHIPS = 3'b001, SODA = 3'b010,
	CANDY = 3'b011, WATER = 3'b100, GUM = 3'b101, CANCEL = 3'b111,NONE = 3'b110;
	
	 reg[7:0] amount2;
	 
	 reg good = 1'b0;

	
	//reg [7:0] state,next_state; 
	
always @(clk)
	begin		
			amount2 = next_state;//store previous value of next_state
			change_nickels = 5'b00000;
	 change_dimes = 4'b0000;
	 change_quarters = 2'b00;
	 change_dollar = 1'b0;
	 item_dispensed = 3'b000;
			case (next_state)		
				
				IDLE:
					case(amount)
							NICKLE: next_state= FIVE;
							DIME:next_state= TEN;
							QUARTER:next_state = TWENTYFIVE;
							DOLLAR: next_state = ONEHUNDRED;
							default:next_state=IDLE;
					endcase				
				
				FIVE:
					case(amount)
							NICKLE: next_state=TEN;
							DIME:next_state=FIFTEEN;
							QUARTER:next_state=THIRTY;
							DOLLAR: next_state=NONE;
							default:next_state=FIVE;
					endcase
				
				TEN:
					case(amount)
							NICKLE: next_state=FIFTEEN;
							DIME:next_state=TWENTY;
							QUARTER:next_state=THIRTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=TEN;
					endcase
				
				FIFTEEN:
					case(amount)
							NICKLE: next_state=TWENTY;
							DIME:next_state=TWENTYFIVE;
							QUARTER:next_state=FORTY;
							DOLLAR: next_state=NONE;
							default:next_state=FIFTEEN;
					endcase
				
				TWENTY:
					case(amount)
							NICKLE: next_state=TWENTYFIVE;
							DIME:next_state=THIRTY;
							QUARTER:next_state=FORTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=TWENTY;
					endcase
				
				TWENTYFIVE:
					case(amount)
							NICKLE: next_state=THIRTY;
							DIME:next_state=THIRTYFIVE;
							QUARTER:next_state=FIFTY;
							DOLLAR: next_state=NONE;
							default:next_state=TWENTYFIVE;
					endcase
				
				THIRTY:
					case(amount)
							NICKLE: next_state= THIRTYFIVE;
							DIME:next_state=FORTY;
							QUARTER:next_state=FIFTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=THIRTY;
					endcase
				
				THIRTYFIVE:
					case(amount)
							NICKLE: next_state=FORTY;
							DIME:next_state=FORTYFIVE;
							QUARTER:next_state=SIXTY;
							DOLLAR: next_state=NONE;
							default:next_state=THIRTYFIVE;
					endcase
				
				
				FORTY:
					case(amount)
							NICKLE: next_state=FORTYFIVE;
							DIME:next_state=FIFTY;
							QUARTER:next_state=SIXTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=FORTY;
					endcase
				
				
				FORTYFIVE:
					case(amount)
							NICKLE: next_state= FIFTY;
							DIME:next_state= FIFTYFIVE;
							QUARTER:next_state=SEVENTY;
							DOLLAR: next_state=NONE;
							default:next_state=FORTYFIVE;
					endcase
				
				
				
				FIFTY:
					case(amount)
							NICKLE: next_state=FIFTYFIVE;
							DIME:next_state=SIXTY;
							QUARTER:next_state=SEVENTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=FIFTY;
					endcase
				
				FIFTYFIVE:
					case(amount)
							NICKLE: next_state=SIXTY;
							DIME:next_state=SIXTYFIVE;
							QUARTER:next_state=EIGHTY;
							DOLLAR: next_state=NONE;
							default:next_state=FIFTYFIVE;
					endcase
				
				SIXTY:
					case(amount)
							NICKLE: next_state=SIXTYFIVE;
							DIME:next_state=SEVENTY;
							QUARTER:next_state=EIGHTYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=SIXTY;
					endcase
				
				SIXTYFIVE:
					case(amount)
							NICKLE: next_state=SEVENTY;
							DIME:next_state=SEVENTYFIVE;
							QUARTER:next_state=NINETY;
							DOLLAR: next_state=NONE;
							default:next_state=SIXTYFIVE;
					endcase
				
				SEVENTY:
					case(amount)
							NICKLE: next_state=SEVENTYFIVE;
							DIME:next_state=EIGHTY;
							QUARTER:next_state=NINETYFIVE;
							DOLLAR: next_state=NONE;
							default:next_state=SEVENTY;
					endcase
				
				SEVENTYFIVE:
					case(amount)
							NICKLE: next_state=EIGHTY;
							DIME:next_state=EIGHTYFIVE;
							QUARTER:next_state=ONEHUNDRED;
							DOLLAR: next_state=NONE;
							default:next_state=SEVENTYFIVE;
					endcase
				
				EIGHTY:
					case(amount)
							NICKLE: next_state=EIGHTYFIVE;
							DIME:next_state=NINETY;
							QUARTER:next_state=NONE;
							DOLLAR: next_state=NONE;
							default:next_state=EIGHTY;
					endcase
				
				EIGHTYFIVE:
					case(amount)
							NICKLE: next_state=NINETY;
							DIME:next_state=NINETYFIVE;
							QUARTER:next_state=NONE;
							DOLLAR: next_state=NONE;
							default:next_state=EIGHTYFIVE;
					endcase
				
				NINETY:
						case(amount)
							NICKLE: next_state=NINETYFIVE;
							DIME:next_state=ONEHUNDRED;
							QUARTER:next_state=NONE;
							DOLLAR: next_state=NONE;
							default:next_state=NINETY;
					endcase
				
				NINETYFIVE:
					case(amount)
							NICKLE: next_state=ONEHUNDRED;
							DIME:next_state=NONE;
							QUARTER:next_state=NONE;
							DOLLAR: next_state=NONE;
							default:next_state=NINETYFIVE;
					endcase
				
				ONEHUNDRED:
					case(amount)
							NICKLE: next_state=NONE;
							DIME:next_state=NONE;
							QUARTER:next_state=NONE;
							DOLLAR: next_state=NONE;
							default:next_state=ONEHUNDRED;
					endcase
					
				NONE: next_state = NONE;
				
				default: next_state = IDLE;
		 endcase		
		 /*********************************************GIVE CHANGE IF APPLICABLE**************/
		// amount2 = next_state;
	   good = 1'b0;
		if(next_state === NONE || next_state===IDLE) amount2= amount2 + amount;
		else amount2 = next_state;
		 
	if((amount2!== NONE || next_state !== IDLE) && (amount2 <= ONEHUNDRED))
	begin
	
	  case(selection)
			RAMEN:if(amount2 >= ONEHUNDRED)begin
					item_dispensed = RAMEN;
					amount2 = amount2 - ONEHUNDRED;
					good = 1'b1;
					end
			CHIPS:if(amount2  >= EIGHTYFIVE)begin
					item_dispensed = CHIPS;
					amount2 = amount2 - EIGHTYFIVE;
					good = 1'b1;
					end
	 
	 
			SODA:if(amount2   >= SEVENTYFIVE)begin
					item_dispensed = SODA;
					amount2 = amount2 - SEVENTYFIVE;
					good = 1'b1;
					end
				
			CANDY:if(amount2   >= FIFTY)begin
					item_dispensed = CANDY;
					amount2 = amount2 - FIFTY;
					good = 1'b1;
					end
				
			WATER:if(amount2   >= TWENTYFIVE)begin
					item_dispensed = WATER;
					amount2 = amount2 - TWENTYFIVE;
					good = 1'b1;
					end
			GUM:if(amount2  >= FIFTEEN)begin
					item_dispensed = GUM;
					amount2 = amount2 - FIFTEEN;
					good = 1'b1;
				 end
			CANCEL: good = 1'b1;
			default: amount2 = amount2;
		endcase
	end
	
	if(amount2 >= ONEHUNDRED ||amount2 === NONE || good===1'b1)
	begin
	
	
			//calculate the number of dollars
			repeat(4) begin
			if(amount2  >= ONEHUNDRED)
			begin
					change_dollar = 1'b1;
					amount2 = amount2 - ONEHUNDRED;
			end
			end
			//calculate the number of quarters
			//good = 1'b1;
			
			repeat(4)
			begin
				if(amount2 >= TWENTYFIVE)
				begin
					amount2 = amount2 - TWENTYFIVE;
					change_quarters = change_quarters + 1;
				end				
			end
			
			repeat(5)
			begin
				if(amount2  >= TEN)
				begin
					amount2 = amount2 - TEN; 
					change_dimes= change_dimes + 1;
				end								
			end
			//calculate the number of nickels
			//good <= 1'b1;
			repeat(5)
			begin
				if(amount2  >= FIVE )
				begin
					amount2 = amount2 - FIVE;
					change_nickels = change_nickels + 1;
				end									
			end
			next_state = IDLE;
			
		end
	
end
 






endmodule
