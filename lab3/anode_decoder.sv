//
// lab3 : version 08/13/2022
//
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module anode_decoder(
	output logic [3:0] anode,
	input logic [1:0] switch_in
	);

	// add the design code here
	//
	always @* begin
		
		// use case staetment to decode
		//
		case (switch_in[1:0])
			2'b00: anode[3:0] = 4'b1110;
			2'b01: anode[3:0] = 4'b1101;
			2'b10: anode[3:0] = 4'b1011;
			2'b11: anode[3:0] = 4'b0111;
		endcase
	end

endmodule
