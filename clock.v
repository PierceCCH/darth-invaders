`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:36 03/06/2023 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input master_clk, // 100MHz
	 input RESET_debounced,
    output reg clk_ship, // 500Hz
	 output reg clk_projectile, // 100Hz
    output reg clk_alien, // 80Hz
    output reg clk_cooldown, // 0.5Hz
	 output reg clk_25MHz
    );
	 
	 reg [19:0] counter_ship;
	 reg [19:0] counter_proj;
	 reg [26:0] counter_alien;
	 reg [26:0] counter_cooldown;
	 reg counter_25;
	 
	 always @ (posedge master_clk) begin
		if (RESET_debounced) begin
			clk_ship <= 0;
			clk_projectile <= 0;
			clk_alien <= 0;
			clk_cooldown <= 0; 
			clk_25MHz <= 0;
			counter_ship <= 20'b0;
			counter_proj <= 20'b0;
			counter_alien <= 27'b0;
			counter_cooldown <= 27'b0;
			counter_25 <= 0;
		end
		else begin
			if (counter_ship == 20'd99_999) begin
//			if (counter_ship == 20'd9) begin
				counter_ship <= 20'd0;
				clk_ship <= !clk_ship;
			end else begin
				counter_ship <= counter_ship + 20'd1;
			end
			
			if (counter_proj == 20'd299_999) begin
//			if (counter_proj == 20'd49) begin
				counter_proj <= 20'd0;
				clk_projectile <= !clk_projectile;
			end else begin
				counter_proj <= counter_proj + 20'd1;
			end
				
			if (counter_alien == 27'd2_999_999) begin
//			if (counter_alien == 20'd62) begin
				counter_alien <= 27'd0;
				clk_alien <= !clk_alien;
			end else begin
				counter_alien <= counter_alien + 27'd1;
			end
				
			if (counter_cooldown == 27'd99_999_999) begin
//			if (counter_cooldown == 27'd9999) begin
				counter_cooldown <= 27'd0;
				clk_cooldown <= !clk_cooldown;
			end else begin
				counter_cooldown <= counter_cooldown + 27'd1;
			end
			
			if (counter_25 == 1) begin
				counter_25 <= 0;
				clk_25MHz <= !clk_25MHz;
			end else begin
				counter_25 <= 1;
			end
		end
	end



endmodule

