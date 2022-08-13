`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module svn_seg_decoder(
	output logic [6:0] seg_out,
	input logic [3:0] bcd_in,
	input logic display_on
	);

	// add the design code here
	//
	always @* begin
		
		// if: display_on is 0, turn all segments off
		//
		if (display_on == 1'b0) begin
			seg_out[6:0] = 7'b1111111;
		end
		else begin

		// if: display_on is 1, use case statement to decode
		//
		//if (display_on == 1'b1) begin
			case (bcd_in[3:0])
				4'b0000: seg_out[6:0] = 7'b1000000; // hexadecimal 0
				4'b0001: seg_out[6:0] = 7'b1111001; // hexadecimal 1
				4'b0010: seg_out[6:0] = 7'b0100100; // hexadecimal 2
				4'b0011: seg_out[6:0] = 7'b0110000; // hexadecimal 3
				4'b0100: seg_out[6:0] = 7'b0011001; // hexadecimal 4
				4'b0101: seg_out[6:0] = 7'b0010010; // hexadecimal 5
				4'b0110: seg_out[6:0] = 7'b0000010; // hexadecimal 6
				4'b0111: seg_out[6:0] = 7'b1111000; // hexadecimal 7
				4'b1000: seg_out[6:0] = 7'b0000000; // hexadecimal 8
				4'b1001: seg_out[6:0] = 7'b0010000; // hexadecimal 9
				4'b1010: seg_out[6:0] = 7'b0100000;	// hexadecimal a
				4'b1011: seg_out[6:0] = 7'b0000011;	// hexadecimal b
				4'b1100: seg_out[6:0] = 7'b1000110;	// hexadecimal c
				4'b1101: seg_out[6:0] = 7'b0100001;	// hexadecimal d
				4'b1110: seg_out[6:0] = 7'b0000110;	// hexadecimal e
				4'b1111: seg_out[6:0] = 7'b0001110;	// hexadecimal f
			endcase
		end
	end

endmodule
