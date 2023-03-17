module aliens_controller(
    input clk_master,
    input clk_aliens,
    input d_reset,
    input [9:0] projectile_x,
    input [9:0] projectile_y,
    output reg [9:0] aliens_x, 
	output reg [9:0] aliens_y,
	output reg [5:0] index_aliens, // MSB -> Alien 5, LSB -> Alien 0
    output reg game_over,
	output reg direction,
	output reg [7:0] score
    );
    
    parameter LEFT_BOUND = 144; // Given these bounds the group will shift 5 times
    parameter RIGHT_BOUND = 584;
	 parameter TOP_BOUND = 134;
    parameter GRID_WIDTH = 40; // Aliens are 40x40, 40 apart
    parameter ALIENS_WIN_LINE = 444;
    parameter PROJECTILE_WIDTH = 14;
	 
	 wire clock_new;
	 reg [26:0] counter_sec;

    reg alien_group_bottom; // depending on if the bottom row of aliens still exist
//    output reg direction; // 0 -> LEFT, 1 -> RIGHT
	 
	 reg test;

    // If alien is dead, set x y coordinates to 10'b1111111111
    reg [9:0] alien0_x, alien0_y, alien1_x, alien1_y, alien2_x, alien2_y;
    reg [9:0] alien3_x, alien3_y, alien4_x, alien4_y, alien5_x, alien5_y;
	 
	 assign clock_new = d_reset ? clk_master : clk_aliens;
		
    always @(posedge clk_master) begin
        if (d_reset) begin
            index_aliens <= 6'b111111;
            game_over <= 0;
            alien_group_bottom <= aliens_y + (3 * GRID_WIDTH);
				counter_sec <= 27'b0;
				score <= 0;
        end
		  
		   if (!game_over && counter_sec == 27'd49_999_999) begin
				counter_sec <= 27'd0;
				score <= score+1;
			end 
			else if (game_over) begin
				score <= score;
			end
			else begin
				counter_sec <= counter_sec + 27'd1;
			end
		  
		  if (index_aliens[0]) begin
            alien0_x <= aliens_x;
            alien0_y <= aliens_y;
        end
        else begin
            alien0_x <= 10'b1111111111;
            alien0_y <= 10'b1111111111;
        end
        if (index_aliens[1]) begin
            alien1_x <= aliens_x + (2 * GRID_WIDTH);
            alien1_y <= aliens_y;
        end
        else begin
            alien1_x <= 10'b1111111111;
            alien1_y <= 10'b1111111111;
        end
        if (index_aliens[2]) begin
            alien2_x <= aliens_x + (4 * GRID_WIDTH);
            alien2_y <= aliens_y;
        end
        else begin
            alien2_x <= 10'b1111111111;
            alien2_y <= 10'b1111111111;
        end
        if (index_aliens[3]) begin
            alien3_x <= aliens_x;
            alien3_y <= aliens_y + (2 * GRID_WIDTH);
        end
        else begin
            alien3_x <= 10'b1111111111;
            alien3_y <= 10'b1111111111;
        end
        if (index_aliens[4]) begin
            alien4_x <= aliens_x + (2 * GRID_WIDTH);
            alien4_y <= aliens_y + (2 * GRID_WIDTH); //
        end
        else begin
            alien4_x <= 10'b1111111111;
            alien4_y <= 10'b1111111111;
        end
        if (index_aliens[5]) begin
            alien5_x <= aliens_x + (4 * GRID_WIDTH);
            alien5_y <= aliens_y + (2 * GRID_WIDTH);
        end
        else begin
            alien5_x <= 10'b1111111111;
            alien5_y <= 10'b1111111111;
        end

        // check if projectile exists. If it does check collisions.
        if ((projectile_x != 10'b1111111111) && (projectile_y != 10'b1111111111)) begin
            // Check if projectile intersects with any of the 6 aliens. If collide, delete alien.
            if (alien0_x != 10'b1111111111) begin
                if ((index_aliens[0] == 1) && (projectile_y > alien0_y) && (projectile_y < (alien0_y + GRID_WIDTH)) && (projectile_x > (alien0_x - PROJECTILE_WIDTH)) && (projectile_x < (alien0_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[0] <= 0;
						  score <= score + 20;
                end
            end
            if (alien1_x != 10'b1111111111) begin
                if ((index_aliens[1] == 1) && (projectile_y > alien1_y) && (projectile_y < (alien1_y + GRID_WIDTH)) && (projectile_x > (alien1_x - PROJECTILE_WIDTH)) && (projectile_x < (alien1_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[1] <= 0;
						  score <= score + 20;
                end
            end
            if (alien2_x != 10'b1111111111) begin
                if ((index_aliens[2] == 1) && (projectile_y > alien2_y) && (projectile_y < (alien2_y + GRID_WIDTH)) && (projectile_x > (alien2_x - PROJECTILE_WIDTH)) && (projectile_x < (alien2_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[2] <= 0;
						  score <= score + 20;
                end
            end
            if (alien3_x != 10'b1111111111) begin
                if ((index_aliens[3] == 1) && (projectile_y > alien3_y) && (projectile_y < (alien3_y + GRID_WIDTH)) && (projectile_x > (alien3_x - PROJECTILE_WIDTH)) && (projectile_x < (alien3_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[3] <= 0;
						  score <= score + 20;
                end
            end
            if (alien4_x != 10'b1111111111) begin
                if ((index_aliens[4] == 1) && (projectile_y > alien4_y) && (projectile_y < (alien4_y + GRID_WIDTH)) && (projectile_x > (alien4_x - PROJECTILE_WIDTH)) && (projectile_x < (alien4_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[4] <= 0;
						  score <= score + 20;
                end
            end
            if (alien5_x != 10'b1111111111) begin
                if ((index_aliens[5] == 1) && (projectile_y > alien5_y) && (projectile_y < (alien5_y + GRID_WIDTH)) && (projectile_x > (alien5_x - PROJECTILE_WIDTH)) && (projectile_x < (alien5_x + GRID_WIDTH)) ) begin
//                    del_proj <= 1;
                    index_aliens[5] <= 0;
						  score <= score + 20;
                end
            end
        end

//        // Since left 3 bits determine the state of the bottom 3 aliens. If all 0 means bottom row dead.
//        if (index_aliens < 6'b000111) begin
//            alien_group_bottom <= aliens_y + GRID_WIDTH;
//        end

        // check if aliens have reached ALIENS_WIN_LINE, if yes, game over
        if (aliens_y + 3 * GRID_WIDTH >= ALIENS_WIN_LINE) begin
            game_over <= 1;
        end
		  if (index_aliens == 0) begin
				game_over <= 1;
				
		  end
    end
    
//     Alien Group movement
    always @(posedge clock_new) begin
	 // calculate coordinates of all aliens
			if (d_reset) begin
            aliens_x <= LEFT_BOUND;
            aliens_y <= TOP_BOUND;
				direction <= 1;
        end	 
		  
        if (direction == 0) begin // Move left
            if (aliens_x > LEFT_BOUND) begin
                aliens_x <= aliens_x - 4;
            end
            else if (aliens_x == LEFT_BOUND) begin // Change direction and shift down
                direction <= 1;
                aliens_y <= aliens_y + 35;
            end
        end
        else if (direction == 1) begin // Move right. 6 * GRID_WIDTH is the width of the alien group
            if (aliens_x < RIGHT_BOUND - (5 * GRID_WIDTH)) begin 
                aliens_x <= aliens_x + 4;
            end
            else if (aliens_x >= (RIGHT_BOUND - (5 * GRID_WIDTH) - 1)) begin // Change direction and shift down
					 direction <= 0;
                aliens_y <= aliens_y + 35;
            end
				else begin
					test <= 0;
				end
        end
    end
endmodule
