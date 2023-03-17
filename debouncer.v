`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:11 03/06/2023 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	 input clk,
    input btn_left,
    input btn_right,
    input btn_fire,
    input btn_reset,
	 output d_left,
	 output d_right,
	 output d_fire,
	 output d_reset
    );
	 
	 single_debouncer uut_left_debouncer(
		 .clk(clk),
		 .button(btn_left),
		 .d_button(d_left)
    );
	 
	 single_debouncer uut_right_debouncer(
		 .clk(clk),
		 .button(btn_right),
		 .d_button(d_right)
    );
	 
	 single_debouncer uut_reset_debouncer(
		 .clk(clk),
		 .button(btn_reset),
		 .d_button(d_reset)
    );
	 
	 single_debouncer uut_fire_debouncer(
		 .clk(clk),
		 .button(btn_fire),
		 .d_button(d_fire)
    );
	 

endmodule
