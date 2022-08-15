//
// lab3 : version 08/13/2022
//
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab3_decoder(
	output logic [3:0] an,
	output logic [6:0] cathode,
	input logic [6:0] sw
	);

	// Enter your code here ...
	//
	// instantiate two outputs from the class presentation, double check with your TA for the values 
	//assign an[3:0] = 4'b1001;
	//assign cathode[6:0] = 4'b0011001;

	anode_decoder u_ad (.anode(an[3:0]), .switch_in(sw[5:4]));
	svn_seg_decoder u_svn (.seg_out(cathode[6:0]), .bcd_in(sw[3:0]), .display_on(sw[6]));

endmodule
