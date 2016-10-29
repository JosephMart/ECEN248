`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 16:13:10 10/24/2016
// Module Name: adder_2bit
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////
module adder_2bit(Carry, Sum, A, B);
	// Initialize Wires
	output wire [1:0] Sum;
	output wire Carry;
	input wire [1:0] A;
	input wire [1:0] B;
	wire Cout;

	// Call 2 Full adders to make it 2-Bit
	full_adder fa0(Sum[0], Cout, A[0], B[0], 0);
	full_adder fa1(Sum[1], Carry, A[1], B[1], Cout );

endmodule
