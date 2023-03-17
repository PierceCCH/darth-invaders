`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:22 03/06/2023 
// Design Name: 
// Module Name:    single_debouncer 
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
module single_debouncer(
    input clk,
    input button,
    output reg d_button
    );
	
	reg[3:0] counter;
	
	always @ (posedge clk) begin
			if (button == 1) begin
				counter <= counter + 1;
				
				if(counter == 4'hf) begin 
					d_button <= 1;
					counter <= 0;
				end
			end
			else begin //otherwise reset the counter
				d_button <= 0;
				counter <= 0;
			end
	end


endmodule
