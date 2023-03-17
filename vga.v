`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:38 03/06/2023
// Design Name:   top
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/vga.v
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

module vga;

	// Inputs
	reg clk;
	reg Hsync;
	reg Vsync;

	// Outputs
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.Hsync(Hsync), 
		.Vsync(Vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Hsync = 0;
		Vsync = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

