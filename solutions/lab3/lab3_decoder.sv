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

	// lab exam
	//
	// any input code from 0-9 displays a 4 on the board
	logic [3:0] num;
	always_comb begin
		case (sw[3:0])
			4'b0000: num[3:0] = 4'b0100; // hexadecimal 0
			4'b0001: num[3:0] = 4'b0100; // hexadecimal 1
			4'b0010: num[3:0] = 4'b0100; // hexadecimal 2
			4'b0011: num[3:0] = 4'b0100; // hexadecimal 3
			4'b0100: num[3:0] = 4'b0100; // hexadecimal 4
			4'b0101: num[3:0] = 4'b0100; // hexadecimal 5
			4'b0110: num[3:0] = 4'b0100; // hexadecimal 6
			4'b0111: num[3:0] = 4'b0100; // hexadecimal 4
			4'b1000: num[3:0] = 4'b0100; // hexadecimal 8
			4'b1001: num[3:0] = 4'b0100; // hexadecimal 9
			4'b1010: num[3:0] = 4'b1010; // hexadecimal a
			4'b1011: num[3:0] = 4'b1011; // hexadecimal b
			4'b1100: num[3:0] = 4'b1100; // hexadecimal c
			4'b1101: num[3:0] = 4'b1101; // hexadecimal d
			4'b1110: num[3:0] = 4'b1110; // hexadecimal e
			4'b1111: num[3:0] = 4'b1111; // hexadecimal f
		endcase
	end
	// instantiate two outputs from the class presentation, double check with your TA for the values 
	//assign an[3:0] = 4'b1001;
	//assign cathode[6:0] = 4'b0011001;

	anode_decoder u_ad (.anode(an[3:0]), .switch_in(sw[5:4]));
	svn_seg_decoder u_svn (.seg_out(cathode[6:0]), .bcd_in(num[3:0]), .display_on(sw[6]));

endmodule
