//
// lab7 : version 08/17/2022
//
`timescale 1ns / 1ps

module rotation_counter (output logic [6:0] cathode, output logic [3:0] anode,
	output logic error, input logic q_a, q_b, input logic rst, input logic clk);

	// digit signals
	logic [3:0] digit3, digit2, digit1, digit0;
	logic enable, up_down;
	logic [1:0] quad_ctl;

	// instantiate display driver
	display_driver u_dd (.cathode, .anode, .anode_sel(), .digit3, .digit2, .digit1,
		.digit0, .display_on(1'b1), .rst, .clk);

	// instantiate up-down counter data path
	up_down_count_dp u_uddp (.digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3), .enable(enable), .up_down(up_down), .rst(rst), .clk(clk));

	// instantiate rotation counter finite state machine
	rc_fsm u_fsm (.error(error), .enable(enable), .up_down(up_down), .quad_ctl(quad_ctl), .rst(rst), .clk(clk));
	

	// instantiate rotary encoder recoder
	rot_enc_rec u_rot (.quad_ctl, .q_a, .q_b, .clk);

endmodule
