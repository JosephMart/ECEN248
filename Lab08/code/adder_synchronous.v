`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 16:53:17 10/24/2016
// Module Name: adder_synchronous
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////
module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
	// Declare Wires
	output reg Carry_reg;
	output reg [1:0] Sum_reg;
	input wire Clk;
	input wire [1:0] A,B;
	reg [1:0] A_reg, B_reg;
	wire Carry;
	wire [1:0] Sum;

	// Instantiate 2-Bit Adder
	adder_2bit  a2b0(Carry, Sum, A_reg, B_reg);

	// Logice for A and B
	always@(posedge Clk)
		begin
			A_reg <= A;
			B_reg <= B;
		end

	// Logice for Sum and Carry
	always@(posedge Clk)
		begin
			Carry_reg <= Carry;
			Sum_reg <= Sum;
		end
endmodule
