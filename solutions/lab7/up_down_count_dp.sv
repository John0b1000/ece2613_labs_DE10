//
// lab7 : version 08/17/2022
//
`timescale 1ns / 1ps

module up_down_count_dp (output logic [3:0] digit3, output logic [3:0] digit2,
	output logic [3:0] digit1, output logic [3:0] digit0,
	input logic enable, input logic up_down, input logic rst, input clk);
	
	// Enter your code here ...
	logic c_out0, c_out1, c_out2;	// internal carry out signals

        // instantiate the 4 binary coded decimal counters
		//
		up_down_bcd_counter u_bcd0 (.carry_out(c_out0), .bcd(digit0), .up_down(up_down), .carry_in(enable), .rst(rst), .clk(clk));
		up_down_bcd_counter u_bcd1 (.carry_out(c_out1), .bcd(digit1), .up_down(up_down), .carry_in(c_out0), .rst(rst), .clk(clk));
		up_down_bcd_counter u_bcd2 (.carry_out(c_out2), .bcd(digit2), .up_down(up_down), .carry_in(c_out1), .rst(rst), .clk(clk));
		up_down_bcd_counter u_bcd3 (.carry_out(), .bcd(digit3), .up_down(up_down), .carry_in(c_out2), .rst(rst), .clk(clk));

endmodule
