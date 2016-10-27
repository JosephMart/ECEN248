`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:39 10/24/2016 
// Design Name: 
// Module Name:    d_latch_behavioral 
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
module d_latch_behavioral(
	output reg Q,
	output wire notQ,
	input wire D, En
    );
	 
	 always@(En or D)
	 if(En)
		Q = D;
	else
		Q = Q;
		
	assign notQ = ~Q;


endmodule
