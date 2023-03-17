`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:42 03/08/2023 
// Design Name: 
// Module Name:    top 
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
module top(
    input BTN_Reset,
    input BTNL,
    input BTNR,
    input BTNU,
    input master_clk,
	 output Hsync,
    output Vsync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue,
	 output game_over,
	 output [7:0] score
    );
	 
	 wire d_left;
	 wire d_right;
	 wire d_fire;
	 wire d_reset;
	 
	 wire clk_ship;
	 wire clk_projectile;
	 wire clk_alien;
	 wire clk_25MHz;
	 wire clk_cooldown;
	 
	 wire [9:0] ship_x;
	 
	 wire [9:0] projectile_x;
	 wire [9:0] projectile_y;
	 wire [9:0] aliens_x;
	 wire [9:0] aliens_y;
	 
	 wire [5:0] index_aliens;
	 wire game_over;
	 wire del_proj; // indicate whether to delete projectile
	 
	 clock VGA_Clock_gen (
	 	 .master_clk(master_clk), 
		 .RESET_debounced(BTN_Reset), 
		 .clk_ship(clk_ship), 
		 .clk_projectile(clk_projectile), 
		 .clk_alien(clk_alien), 
		 .clk_cooldown(clk_cooldown),
		 .clk_25MHz(clk_25MHz)
	 );
	
	 debouncer debouncer (
		.clk(master_clk),
		.btn_left(BTNL),
		.btn_right(BTNR),
		.btn_fire(BTNU),
		.btn_reset(BTN_Reset),
		.d_left(d_left),
		.d_right(d_right),
		.d_fire(d_fire),
		.d_reset(d_reset)
	 );
	 
	 ship_controller ship_controller(
		 .clk_master(master_clk),
		 .clk_ship(clk_ship),
		 .d_reset(BTN_Reset),
		 .d_right(d_right),
		 .d_left(d_left),
		 .ship_x(ship_x)
    );
	 
	 projectile projectile(
		 .ship_xcoord(ship_x),
		 .db_fire(BTNU),
		 .clk_projectile(clk_projectile),
		 .clk(master_clk),
		 .rst(BTN_Reset),
		 .proj_xcoord(projectile_x),
		 .proj_ycoord(projectile_y),
		 .fire(fire)
    );
	 
	 aliens_controller aliens_controller(
		 .clk_master(master_clk),
		 .clk_aliens(clk_alien),
		 .d_reset(BTN_Reset),
		 .projectile_x(projectile_x),
		 .projectile_y(projectile_y),
		 .aliens_x(aliens_x), 
		 .aliens_y(aliens_y),
		 .index_aliens(index_aliens), // MSB -> Alien 5, LSB -> Alien 0
		 .game_over(game_over),
		 .score(score),
		.direction(direction)
    );
	 
	 
	 vga_top vga_top(
		.clk_25MHz(clk_25MHz),
		.d_reset(BTN_Reset),
		.game_over(game_over),
		.ship_x(ship_x),
		.aliens_x(aliens_x), 
		.aliens_y(aliens_y),
		.projectile_x(projectile_x),
		.projectile_y(projectile_y),
		.index_aliens(index_aliens),
		.Hsync(Hsync),
		.Vsync(Vsync),
		.red(red),
		.green(green),
		.blue(blue)
   );


endmodule
