// Define ship as top left coordinate. Leave drawing to game controller.

module ship_controller (
    input clk_master,
    input clk_ship,
    input d_reset,
    input d_right, d_left,
    output reg [9:0] ship_x
    );

    // only need to store x position of ship
    reg [9:0] ship_x_pos;

    parameter left_bound = 144;
    parameter right_bound = 584;
    parameter width = 24;
	 
	 wire clock_new;
	 assign clock_new = d_reset ? clk_master : clk_ship;
    
    
    //ship movement
    always @(posedge clock_new) begin
        if (d_reset) begin
          ship_x_pos <= (left_bound - width + right_bound) / 2;
        end

        else if (d_right) begin
            if (ship_x_pos < right_bound - 24) begin
                ship_x_pos <= ship_x_pos + 1;
            end
        end
        else if (d_left) begin
            if (ship_x_pos > left_bound) begin
                ship_x_pos <= ship_x_pos - 1;
            end
        end
        ship_x <= ship_x_pos;
    end

endmodule
