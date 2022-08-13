`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module d_flip_flop (output logic q, input logic d, input logic clk);


	//add code here
	//

	// declare internal signals
	//
	logic q_to_d;

	// instantiate two transparent latches and wire back-to-back
	transparent_d_latch u_master (.q(q_to_d), .d(d), .c(~clk));
	transparent_d_latch u_servant (.q(q), .d(q_to_d), .c(clk));

endmodule
