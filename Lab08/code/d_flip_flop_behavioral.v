`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:56 10/24/2016 
// Design Name: 
// Module Name:    d_flip_flop_behavioral 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module d_flip_flop_behavioral(
		output reg Q,
		output wire notQ,
		input wire D,
		input wire Clk
    );

	always@(posedge Clk)
		Q <= D;
		
	assign notQ = ~Q;

endmodule
