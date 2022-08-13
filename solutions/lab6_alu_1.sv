//
// lab6 : version 08/13/2022
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab6_alu_1 (
	output logic c_out,
	output logic [6:0] cathode,
	input logic [11:0] sw
	);

	// Enter your code here ...
	//
	
	// declare internal signals
	//
	logic [3:0] result;

	// instantiate the appropriate modules
	//
	alu_1 u_alu (.f(result[3:0]), .c_out(c_out), .a(sw[3:0]), .b(sw[7:4]), .c_in(sw[8]), .sel(sw[11:9]));
	svn_seg_decoder u_svn (.seg_out(cathode[6:0]), .bcd_in(result[3:0]), .display_on(1'b1));

endmodule
