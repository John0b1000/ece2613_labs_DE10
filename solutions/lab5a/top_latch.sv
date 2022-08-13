`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module top_latch (output logic qa, output logic qb, output logic q_lvl,
	output logic q_latch, output logic q_ff,
	input logic s, input logic r, input logic d, input logic ck);

// add init code here
//
sr_latch u_sr (.qa(qa), .qb(qb), .s(s), .r(r)); // sr_latch u_sr (.*); using dot-star port connection
lvl_sen_sr_latch u_lvl_sen (.q(q_lvl), .s(s), .c(ck), .r(r)); // lvl_sen_sr_latch u_lvl_sen (.q(q_lvl), .s, .c(ck), .r); using dot-name port connection
transparent_d_latch u_tra (.q(q_latch), .d(d), .c(ck));
d_flip_flop u_dff (.q(q_ff), .d(d), .clk(ck));

endmodule
