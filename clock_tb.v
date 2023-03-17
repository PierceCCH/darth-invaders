`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:45:37 03/06/2023
// Design Name:   clock
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/clock_tb.v
// Project Name:  Lab4_DarthinVader
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_tb;

	// Inputs
	reg master_clk;
	reg RESET_debounced;

	// Outputs
	wire clk_ship;
	wire clk_projectile;
	wire clk_alien;
	wire clk_25MHz;
	wire clk_cooldown;

	// Instantiate the Unit Under Test (UUT)
	clock uut (
		.master_clk(master_clk), 
		.RESET_debounced(RESET_debounced), 
		.clk_ship(clk_ship), 
		.clk_projectile(clk_projectile), 
		.clk_alien(clk_alien), 
		.clk_cooldown(clk_cooldown),
		.clk_25MHz(clk_25MHz)
	);
	
	initial begin
		// Initialize Inputs
		master_clk = 0;
		RESET_debounced = 1;

		// Wait 100 ns for global reset to finish
		#100;
		RESET_debounced = 0;
        
		// Add stimulus here

	end
	
	always #0.01 master_clk = ~master_clk;
      
endmodule

