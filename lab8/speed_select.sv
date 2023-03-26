//
// lab8 : version 03/25/2023
//
`timescale 1ns / 1ps
module speed_select (output logic [27:0] speed, input logic control);

    // control various aspects of the timer
	//
	always_comb begin

		// decode counter speed (SW2 and SW3)
		//
        /*
		case (control[1:0])
			2'b00: speed = 28'h000C34F; // 1 millisecond rate
			2'b01: speed = 28'h007A11F; // 10 millisecond rate
			2'b10: speed = 28'h026259F; // 50 millisecond rate
			2'b11: speed = 28'h2FAF07F; // 1000 millisecond rate 
		endcase
        */
        
        if (control == 1'b1) begin
            speed = 28'h2FAF07F; // 1000 millisecond rate
        end
        else begin
            speed = 28'h026259F; // 50 millisecond rate
        end
	end
endmodule