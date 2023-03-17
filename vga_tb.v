`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:12 03/06/2023
// Design Name:   top
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/vga_tb.v
// Project Name:  Lab4_DarthinVader
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_tb;

	// Inputs
	reg clk_25MHz;
	reg res;

	// Outputs
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;
	wire Hsync;
	wire Vsync;

	// Instantiate the Unit Under Test (UUT)
	vga_top uut (
		.clk_25MHz(clk_25MHz), 
		.Hsync(Hsync), 
		.Vsync(Vsync), 
		.d_reset(res),
		.red(red), 
		.green(green), 
		.blue(blue)
	);
//
	initial begin
		// Initialize Inputs
		clk_25MHz = 0;
		res = 1;
//		Hsync = 0;
//		Vsync = 0;

		// Wait 100 ns for global reset to finish
		#100;
		res = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     
	  always #5 clk_25MHz = ~clk_25MHz;
endmodule

