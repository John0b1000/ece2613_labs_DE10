//
// lab8 : version 03/25/2023
//
// This design was created by Dr. Frank Higgins
// and modified by John Nori for the purposes of this lab.
// This design can be found in the Module 8 Videos on the
// DCD course Canvas page.
//
`timescale 1ns / 1ps
module counter_divider #(parameter BIT_SIZE=28)
  (output logic tc, input logic clk, input logic rst,
   input logic [BIT_SIZE-1:0] i_count, input logic ena);
  
  logic [BIT_SIZE-1:0] count, next_count;
  
  // synchronous logic
  always @(posedge clk) begin
    count <= next_count;
  end
  
  // combinational logic
  always_comb begin
    // defaults
    tc = 0;
    next_count = count;	// hold the count
    if (ena == 1) begin
      // count down
      next_count = count - 1;
      if (count == 0) begin
        tc = 1;	// set tc to 1 if count = 0
        next_count = i_count;	// and initialize to i_count
      end	// end of count = 0 if
    end	// end of enable if
    // priority logic
    if (rst == 1) begin
      next_count = i_count;	// and initialize to i_count
    end
  end
  
endmodule