`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:04:22 03/13/2023
// Design Name:   aliens_controller
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/alien_tb.v
// Project Name:  Lab4_DarthinVader
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aliens_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alien_tb;

	// Inputs
	reg clk_master;
	reg clk_aliens;
	reg d_reset;
	reg [9:0] projectile_x;
	reg [9:0] projectile_y;

	// Outputs
	wire [9:0] aliens_x;
	wire [9:0] aliens_y;
	wire [5:0] index_aliens;
	wire game_over;
	wire del_proj;

	// Instantiate the Unit Under Test (UUT)
	aliens_controller uut (
		.clk_master(clk_master), 
		.clk_aliens(clk_aliens), 
		.d_reset(d_reset), 
		.projectile_x(projectile_x), 
		.projectile_y(projectile_y), 
		.aliens_x(aliens_x), 
		.aliens_y(aliens_y), 
		.index_aliens(index_aliens), 
		.game_over(game_over), 
		.del_proj(del_proj)
	);

	initial begin
		// Initialize Inputs
		clk_master = 0;
		clk_aliens = 0;
		d_reset = 1;
		projectile_x = 0;
		projectile_y = 0;

		// Wait 100 ns for global reset to finish
		#100;
		d_reset = 0;
        
		// Add stimulus here

	end
	always #0.1 clk_master = ~clk_master;
	always #5 clk_aliens = ~clk_aliens;
      
endmodule

