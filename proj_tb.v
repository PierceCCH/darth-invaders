`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:15 03/13/2023
// Design Name:   projectile
// Module Name:   C:/Users/Student/Documents/Lab3GrpACASSA/Lab3GrpACASSA/Lab4_DarthinVader/proj_tb.v
// Project Name:  Lab4_DarthinVader
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: projectile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module proj_tb;

	// Inputs
	reg [9:0] ship_xcoord;
	reg db_fire;
	reg clk_projectile;
	reg clk;
	reg rst;

	// Outputs
	wire [9:0] proj_xcoord;
	wire [9:0] proj_ycoord;

	// Instantiate the Unit Under Test (UUT)
	projectile uut (
		.ship_xcoord(ship_xcoord), 
		.db_fire(db_fire), 
		.clk_projectile(clk_projectile), 
		.clk(clk), 
		.rst(rst),
		.proj_xcoord(proj_xcoord), 
		.proj_ycoord(proj_ycoord)
	);

	initial begin
		// Initialize Inputs
		ship_xcoord = 300;
		db_fire = 0;
		clk_projectile = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#10000;
		rst = 0;
        
		// Add stimulus here
		#100000000;
		db_fire = 1;

	end
	always #5 clk_projectile = ~clk_projectile;
	always #1 clk = ~clk;
      
endmodule

