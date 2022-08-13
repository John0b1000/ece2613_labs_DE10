//
// lab1 : version 06/12/2020
// 
`timescale 1ns / 1ps
module gates(
	output logic f0, output logic f1, output logic f2, output logic f3,
	input logic a0, input logic b0, input logic a1, input logic b1,
	input logic a2, input logic b2, input logic a3, input logic b3
	);

	// Enter your code here ...
	//
	// instantiate gates
	//
	assign f0 = a0 & b0; // u1 --> AND
	assign f1 = a1 | b1; // u2 --> OR
	assign f2 = a2 ^ b2; // u3 --> XOR
	assign f3 = ~(a3 & b3); // u4 --> NAND

endmodule
