//
// lab7 : version 08/17/2022
// 
`timescale 1ns / 1ps

module rc_fsm (output logic enable, output logic up_down,
	output logic error, input logic [1:0] quad_ctl,
	input logic rst, input logic clk);

	enum logic [1:0] {HOLD, UP, DOWN, ERROR} state, next_state;

	// Enter your code here ...
	// sequential logic
	always_ff @(posedge clk) begin
		state <= next_state;
	end

	// combinational logic
	always_comb begin
		
		// defaults
		// 
		next_state = state; // hold operation
		enable = 1'b0;
		error = 1'b0;
		up_down = 1'b0;

		// main logic
		//
		case (state)
			HOLD: begin
				case (quad_ctl)
					2'b00: next_state = HOLD;
					2'b01: next_state = UP;
					2'b10: next_state = DOWN;
					2'b11: next_state = ERROR;
				endcase
			end
			UP: begin
				enable = 1'b1;
				up_down = 1'b1;
				case (quad_ctl)
					2'b00: next_state = HOLD;
					2'b01: next_state = UP;
					2'b10: next_state = DOWN;
					2'b11: next_state = ERROR;
				endcase
			end
			DOWN: begin
				enable = 1'b1;
				case (quad_ctl)
					2'b00: next_state = HOLD;
					2'b01: next_state = UP;
					2'b10: next_state = DOWN;
					2'b11: next_state = ERROR;
				endcase
			end
			ERROR: error = 1'b1; // forever unitl reset
		endcase

		if (rst == 1'b1) begin	// priority logic
			next_state = HOLD;
		end
	end

endmodule
