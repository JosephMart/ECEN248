`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:23 10/10/2016 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder(S, Cout, A, B, Cin );
	// Declare input and output ports
	input wire A, B, Cin;
	output wire S, Cout;
	
	// Declare wi res
	wire andBCin, andACin, andAB; // add more
	
	// Use dataflow to create gatelevel commands
	assign #6 S = A ^ B ^ Cin; // ^ is XOR
	assign #4 andAB = A & B;
	assign #4 andBCin = B & Cin;
	assign #4 andACin = A & Cin;
	assign #6 Cout = andAB | andBCin | andACin;
	


endmodule
