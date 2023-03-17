`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:40 03/06/2023 
// Design Name: 
// Module Name:    vertical 
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
module vertical(
    input clk_25Mhz,
	 input d_reset,
	 input enable_v_count,
    output reg [15:0] v_count_value
    );

always@(posedge clk_25Mhz) begin
	if (d_reset) begin
		v_count_value <= 0;
	end
	if (enable_v_count == 1'b1) begin
		if (v_count_value < 524) begin
			v_count_value <= v_count_value + 16'b1; //keep counting until
		end
		else begin
			v_count_value <= 16'b0; //reset vert counter
		end
	end
end
endmodule
