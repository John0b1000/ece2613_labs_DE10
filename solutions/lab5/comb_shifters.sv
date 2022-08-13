//
// lab5 : version 08/13/2022
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module comb_shifters (output logic [7:0] data_out, input logic [2:0] select,
	input logic [7:0] data_in);

	// Enter your code here ...
	//
	
	// use an always block with a case statement to decode input
	//
	always_comb begin
		case (select[2:0])
			3'b001: data_out = data_in << 1; // shift 1 bit left, pad with 0
			3'b010: data_out = data_in >> 1; // shift 1 bit right, pad with 0
			3'b011: data_out = {data_in[6:0], data_in[7]}; // circular shift 1 bit left
			3'b100: data_out = {data_in[0], data_in[7:1]}; // circular shift 1 bit right
			3'b101: data_out = $signed(data_in) >>> 1; // arithemtic shift 1 bit right, pad with sign
			3'b110: data_out = {data_in[4:0], data_in[7:5]}; // barrel circular shift left by 3 bits
			3'b111: data_out = $signed(data_in) >>> 5; // barrel arithmetic right shift by 5 bits
			default:data_out = data_in; // no operation, output = input
		endcase
	end

endmodule
