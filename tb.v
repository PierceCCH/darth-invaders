`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:19 03/13/2023
// Design Name:   top
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/tb.v
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

module tb;

	// Inputs
	reg BTN_Reset;
	reg BTNL;
	reg BTNR;
	reg BTNU;
	reg master_clk;

	// Outputs
	wire Hsync;
	wire Vsync;
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.BTN_Reset(BTN_Reset), 
		.BTNL(BTNL), 
		.BTNR(BTNR), 
		.BTNU(BTNU), 
		.master_clk(master_clk), 
		.Hsync(Hsync), 
		.Vsync(Vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	initial begin
		// Initialize Inputs
		BTN_Reset = 0;
		BTNL = 0;
		BTNR = 0;
		BTNU = 0;
		master_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      BTN_Reset = 1;
		// Add stimulus here
		
		#1000;
      BTN_Reset = 0;
		BTNU = 1;
		
		#1000;
		BTNU = 0;
	end
   always #5 master_clk = ~master_clk;
endmodule

