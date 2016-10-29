`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 16:06:56 10/24/2016
// Module Name: d_flip_flop_behavioral
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////
module d_flip_flop_behavioral(
		// Declare wires
		output reg Q,
		output wire notQ,
		input wire D,
		input wire Clk
    );

	// Logic for Positive Edge of Clock
	always@(posedge Clk)
		Q <= D;

	// Catch all Case
	assign notQ = ~Q;
endmodule
