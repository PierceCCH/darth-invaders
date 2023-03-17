`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:13 03/13/2023
// Design Name:   ship_controller
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/ship_tb.v
// Project Name:  Lab4_DarthinVader
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ship_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ship_tb;

	// Inputs
	reg clk_ship;
	reg d_reset;
	reg d_right;
	reg d_left;

	// Outputs
	wire [9:0] ship_x;

	// Instantiate the Unit Under Test (UUT)
	ship_controller uut (
		.clk_ship(clk_ship), 
		.d_reset(d_reset), 
		.d_right(d_right), 
		.d_left(d_left), 
		.ship_x(ship_x)
	);

	initial begin
		// Initialize Inputs
		clk_ship = 0;
		d_reset = 1;
		d_right = 0;
		d_left = 0;

		// Wait 100 ns for global reset to finish
		#100;
		d_reset = 0;
		d_left = 1;
      #100000;
		d_left = 0;
		d_right = 1;
		// Add stimulus here
		#100000;
		d_right = 0;

	end
	always #1 clk_ship = ~clk_ship;
      
endmodule

