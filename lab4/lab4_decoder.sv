//
// lab4 : version 08/13/2022
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab4_decoder(
	output logic [3:0] led,
	output logic [3:0] an,
	output logic [6:0] cathode,
	input logic [6:0] sw
	);

	// insert your code here
	//
	// declare bad_bit wire
	//
	logic [2:0] bad_bit;
	
	// instantiate decoder modules
	//
	svn_seg_decoder u_svn(.seg_out(cathode[6:0]), .bcd_in({1'b0, bad_bit[2:0]}), .display_on(1'b1));
	hamming7_4_decode u_hdcde(.bad_bit(bad_bit[2:0]), .decode(led[3:0]), .h_code(sw[6:0]));

	// hardwire only the first digit
	//
	assign an = 4'b1110;

endmodule
