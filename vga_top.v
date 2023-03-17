`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:07 03/06/2023 
// Design Name: 
// Module Name:    top 
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
module vga_top(
    input clk_25MHz,
		input d_reset,
		input [9:0] aliens_x,
		input [9:0] aliens_y,
		input [9:0] ship_x,
		input [9:0] projectile_x,
		input [9:0] projectile_y,
		input [5:0] index_aliens,
		input game_over,
    output Hsync,
    output Vsync,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
  );
	
	wire enable_v_count;
	wire [15:0] h_count_value;
	wire [15:0] v_count_value;

	parameter LEFT_BOUND = 144; // Given these bounds the group will shift 5 times
	parameter RIGHT_BOUND = 584;
	parameter TOP_BOUND = 134;
	parameter BOTTOM_BOUND = 494;

	parameter GRID_WIDTH = 10'b101000; // Aliens are 40x40, 40 apart
	parameter ALIENS_WIN_LINE = 444;

	parameter PROJECTILE_WIDTH = 14;
	parameter PROJECTILE_HEIGHT = 14;

	parameter SHIP_WIDTH = 40;
	parameter SHIP_HEIGHT = 24;
	
	horizontal VGA_Horiz (clk_25MHz, d_reset, enable_v_count, h_count_value);
	vertical VGA_Verti (clk_25MHz, d_reset, enable_v_count, v_count_value);

	// vsync and hsync
	assign Hsync = (h_count_value < 96) ? 1'b1 : 1'b0;
	assign Vsync = (v_count_value < 2) ? 1'b1 : 1'b0;

	reg [9:0] alien0_x, alien0_y, alien1_x, alien1_y, alien2_x, alien2_y;
	reg [9:0] alien3_x, alien3_y, alien4_x, alien4_y, alien5_x, alien5_y;
	
	always @* begin
		// --- Determine individual alien coords
		if (index_aliens[0]) begin
				alien0_x <= aliens_x;
				alien0_y <= aliens_y;
		end
		else begin
				alien0_x <= 10'b1111111111;
				alien0_y <= 10'b1111111111;
		end
		if (index_aliens[1]) begin
				alien1_x <= aliens_x + (10'b10 * GRID_WIDTH);
				alien1_y <= aliens_y;
		end
		else begin
				alien1_x <= 10'b1111111111;
				alien1_y <= 10'b1111111111;
		end
		if (index_aliens[2]) begin
				alien2_x <= aliens_x + (10'b100 * GRID_WIDTH);
				alien2_y <= aliens_y;
		end
		else begin
				alien2_x <= 10'b1111111111;
				alien2_y <= 10'b1111111111;
		end
		if (index_aliens[3]) begin
				alien3_x <= aliens_x;
				alien3_y <= aliens_y + (10'b10 * GRID_WIDTH);
		end
		else begin
				alien3_x <= 10'b1111111111;
				alien3_y <= 10'b1111111111;
		end
		if (index_aliens[4]) begin
				alien4_x <= aliens_x + (10'b10 * GRID_WIDTH);
				alien4_y <= aliens_y + (10'b10 * GRID_WIDTH);
		end
		else begin
				alien4_x <= 10'b1111111111;
				alien4_y <= 10'b1111111111;
		end
		if (index_aliens[5]) begin
				alien5_x <= aliens_x + (10'b100 * GRID_WIDTH);
				alien5_y <= aliens_y + (10'b10 * GRID_WIDTH);
		end
		else begin
				alien5_x <= 10'b1111111111;
				alien5_y <= 10'b1111111111;
		end
		// --------------------------------

		// Draw MArgins
		if (game_over == 1) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
		end
		else if (v_count_value > BOTTOM_BOUND || v_count_value < TOP_BOUND) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
		end
		else if (h_count_value < LEFT_BOUND || h_count_value > RIGHT_BOUND) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
		end

		// Draw ship
		else if (h_count_value < ship_x + SHIP_WIDTH && h_count_value > ship_x && 
							v_count_value < ALIENS_WIN_LINE + SHIP_HEIGHT && v_count_value > ALIENS_WIN_LINE) begin
			red <= 4'h0;
			green <= 4'hF;
			blue <= 4'h0;
		end

		// Draw projectile
		else if (h_count_value < projectile_x + PROJECTILE_WIDTH && h_count_value > projectile_x && 
							v_count_value < projectile_y + PROJECTILE_HEIGHT && v_count_value > projectile_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'hF;
		end

		// Draw alien 1
		else if (h_count_value < alien0_x + GRID_WIDTH && h_count_value > alien0_x && 
							v_count_value < alien0_y + GRID_WIDTH && v_count_value > alien0_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end
		// Draw alien 2
		else if (h_count_value < alien1_x + GRID_WIDTH && h_count_value > alien1_x && 
							v_count_value < alien1_y + GRID_WIDTH && v_count_value > alien1_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end
		// Draw alien 3
		else if (h_count_value < alien2_x + GRID_WIDTH && h_count_value > alien2_x && 
							v_count_value < alien2_y + GRID_WIDTH && v_count_value > alien2_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end
		// Draw alien 4
		else if (h_count_value < alien3_x + GRID_WIDTH && h_count_value > alien3_x && 
							v_count_value < alien3_y + GRID_WIDTH && v_count_value > alien3_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end
		// Draw alien 5
		else if (h_count_value < alien4_x + GRID_WIDTH && h_count_value > alien4_x && 
							v_count_value < alien4_y + GRID_WIDTH && v_count_value > alien4_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end	
		// Draw alien 6
		else if (h_count_value < alien5_x + GRID_WIDTH && h_count_value > alien5_x && 
							v_count_value < alien5_y + GRID_WIDTH && v_count_value > alien5_y) begin
			red <= 4'hF;
			green <= 4'h0;
			blue <= 4'h0;
		end
		else begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
		end
	end
endmodule

//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date:    15:23:07 03/06/2023 
//// Design Name: 
//// Module Name:    top 
//// Project Name: 
//// Target Devices: 
//// Tool versions: 
//// Description: 
////
//// Dependencies: 
////
//// Revision: 
//// Revision 0.01 - File Created
//// Additional Comments: 
////
////////////////////////////////////////////////////////////////////////////////////
//module vga_top(
//    input clk_25MHz,
//	 input d_reset,
//	 input [9:0] ship_x,
//    output Hsync,
//    output Vsync,
//    output reg [3:0] red,
//    output reg [3:0] green,
//    output reg [3:0] blue
//   );
//	
//	
//	wire enable_v_count;
//	wire [15:0] h_count_value;
//	wire [15:0] v_count_value;
//	
//	horizontal VGA_Horiz (clk_25MHz, d_reset, enable_v_count, h_count_value);
//	vertical VGA_Verti (clk_25MHz, d_reset, enable_v_count, v_count_value);
//
//	//outputs
//	assign Hsync = (h_count_value < 96)?1'b1:1'b0;
//	assign Vsync = (v_count_value < 2)?1'b1:1'b0;
//	
//	always @* begin
//		if (v_count_value < 134 || v_count_value > 494) begin
//			red <= 4'h0;
//			green <= 4'h0;
//			blue <= 4'h0;
//		end
//		
//		else if (h_count_value < 144 || h_count_value > 584) begin
//			red <= 4'h0;
//			green <= 4'h0;
//			blue <= 4'h0;
//		end
//		
//		else if (h_count_value < ship_x+30 && h_count_value > ship_x && v_count_value < 494 && v_count_value > 470) begin
//			red <= 4'h0;
//			green <= 4'hF;
//			blue <= 4'h0;
//		end
//		
//		else begin
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'hF;
//		end
//		
//		// add code for alien, projectile, and ship here
//	end
//endmodule
//
//
