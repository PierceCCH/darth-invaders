`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:28 03/08/2023 
// Design Name: 
// Module Name:    projectile 
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
module projectile(
    input [9:0] ship_xcoord,
    input db_fire,
    input clk_projectile,
    input clk,
	 input rst,
    output reg [9:0] proj_xcoord,
    output reg [9:0] proj_ycoord,
	 output reg fire
    );
	 
   reg reset_counter;
   reg [26:0] counter;
	wire clock_new;
	assign clock_new = (rst || reset_counter || (db_fire == 1 && counter == 99_999_999)) ? clk : clk_projectile;


   always @(posedge clock_new) begin
		 if (rst) begin
				proj_xcoord <= 0;
				proj_ycoord <= 0;
			   reset_counter <= 0;
				fire <= 0;
		 end
		 
		 if (reset_counter) begin
			reset_counter <= 0;
			fire <= 0;
		end
		 
       if (proj_ycoord != 0) begin
           if (proj_ycoord == 144) begin
               proj_xcoord <= 0;
               proj_ycoord <= 0;
           end
           else begin
               proj_xcoord <= proj_xcoord;
               proj_ycoord <= proj_ycoord - 1;
           end
       end
		 
		 else begin
           if (db_fire == 1 && counter == 99_999_999) begin
               proj_xcoord <= ship_xcoord;
               proj_ycoord <= 444;
					reset_counter <= 1;
					fire <= 1;
           end
       end
   end


   always @(posedge clk) begin
		 if (rst) begin
			counter <= 99_999_999;
		 end
			
       else if (reset_counter) begin
           counter <= 0;
       end
		 
       else if (counter != 99_999_999) begin
           counter <= counter + 1;
       end
   end

endmodule
