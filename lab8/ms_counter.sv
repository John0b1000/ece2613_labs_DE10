//
// lab8 : version 03/25/2023
//
`timescale 1ns / 1ps
module ms_counter (output logic [6:0] cathode, output logic [3:0] anode, input logic [3:0] control, input logic rst, input logic clk);
	
	// Enter your code here ...
	// digit signals
	//
	logic [3:0] digit3, digit2, digit1, digit0;
	logic ovf;
	logic [27:0] speed;

	// instantiate display driver
	display_driver u_dd (.cathode, .anode, .anode_sel(), .digit3, .digit2, .digit1,
		.digit0, .display_on(1'b1), .rst, .clk);

	// instantiate speed controller
	speed_select u_ss (.speed(speed[27:0]), .control(control[2:2]));

	// instantiate up-down counter data path
	up_down_count_dp u_uddp (.digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3), .enable(ovf), .up_down(control[1:1]), .rst(rst), .clk(clk));

	// instantiate millisecond counter divider
    counter_divider u_cd (.tc(ovf), .rst, .clk, .ena(control[0:0]), .i_count(speed));
endmodule