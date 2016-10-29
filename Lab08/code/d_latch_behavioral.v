`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 16:00:39 10/24/2016
// Module Name: d_latch_behavioral
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////
module d_latch_behavioral(
	// Declare Input/Output Wires
	output reg Q,
	output wire notQ,
	input wire D, En
    );

	// Logic for D-Latch
	 always@(En or D)
	 if(En)
			Q = D;
		else
			Q = Q;
	// Catch All
	assign notQ = ~Q;
endmodule
