//
// lab4 : version 08/13/2022
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module hamming7_4_decode(
	output logic [3:1] bad_bit,
	output logic [4:1] decode,
	input logic [7:1] h_code
	);

	// Enter your code here ...
	//

	// assign the message bits
	//
	assign decode[4:1] = {h_code[7], h_code[6], h_code[5], h_code[3]};

	// perform parity checks
	//
	assign bad_bit[1] = h_code[1] ^ h_code[3] ^ h_code[5] ^ h_code[7];
	assign bad_bit[2] = h_code[2] ^ h_code[3] ^ h_code[6] ^ h_code[7];
	assign bad_bit[3] = h_code[4] ^ h_code[5] ^ h_code[6] ^ h_code[7];

endmodule
