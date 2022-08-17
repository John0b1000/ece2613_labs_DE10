//
// lab7 : version 08/17/2022
// 
`timescale 1ns / 1ps

module d_counter (output logic [1:0] ms_bits, input logic clk, input logic rst);

	// signals for 17 bit counter
	logic [16:0] count, next_count;

	// assign the most significant bits
	assign ms_bits = count[16:15];

	// synchronous logic
	//
	always_ff @(posedge clk) begin
		count <= next_count;
	end

	// combinational logic
	//
	always_comb begin
		
		// main logic (implement modulo 2 17-bit counter)
		//
		next_count = count + 1;

		// priority logic
		//
		if (rst == 1'b1) begin
			next_count = 17'b0;
		end
		/*case (rst)
			1'b0: begin
				ms_bits[1:0] = 2'b00;
				next_count = 17'b0;
			end
			1'b1: ms_bits[1:0] = 2'b01;
		endcase*/
	end

endmodule
