//
// lab7 : version 08/17/2022
//
`timescale 1ns / 1ps

module up_down_bcd_counter (output logic [3:0] bcd, output logic carry_out,
	input logic carry_in, input logic up_down, input logic rst, input logic clk);
	
	// Enter your code here ...
	logic [3:0] next_bcd;

	// sequential logic
	always_ff @(posedge clk) begin
		bcd <= next_bcd;
	end

	// combinational logic
	always_comb begin

		// default logic
		//
		next_bcd = bcd; // hold
		carry_out = 1'b0;

		// main logic
		//
		if (carry_in == 1'b1) begin
			if (up_down == 1'b1) begin
				case (bcd)
					4'd9: begin 
						next_bcd = 4'd0; // roll over
						carry_out = 1'b1; // activate next digit
					end
					default: next_bcd = bcd + 1; // count up
				endcase
			end else begin
				case (bcd)
					4'd0: begin
						next_bcd = 4'd9; // roll over
						carry_out = 1'b1; // activate next digit
					end
					default: next_bcd = bcd - 1; // count down
				endcase
			end
		end

		// priority logic
		//
		if (rst == 1'b1) begin
			next_bcd = 4'd0;
		end
	end

endmodule
