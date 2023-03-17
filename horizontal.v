`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:36 03/06/2023 
// Design Name: 
// Module Name:    horizontal 
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
module horizontal(
    input clk_25Mhz,
	 input d_reset,
	 output reg enable_v_count,
    output reg [15:0] h_count_value
    );

always@(posedge clk_25Mhz) begin
	if (d_reset) begin
		enable_v_count <= 0;
		h_count_value <= 16'b0;
	end
	if (h_count_value < 16'b1100011111) begin
		h_count_value <= h_count_value + 16'b1;
		enable_v_count <= 0; //disable vert counter
	end
	else begin
		h_count_value <= 16'b0; //reset Hori counter
		enable_v_count <= 1; //trigger V count
	end
	
end
endmodule
