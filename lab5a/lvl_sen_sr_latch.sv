//
// lab5a : version 08/13/2022
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lvl_sen_sr_latch (output logic q, input logic s, input logic r,
	input logic c);


	// add output from and gates
	//
	logic s1;
	logic r1;
	assign s1 = s & c;
	assign r1 = r & c;
	
	// add init code here
	//
	sr_latch u_sr (.qb(q), .s(s1), .r(r1));

endmodule
