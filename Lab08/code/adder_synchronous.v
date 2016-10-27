`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:17 10/24/2016 
// Design Name: 
// Module Name:    adder_synchronous 
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
module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);

	output reg Carry_reg;
	output reg [1:0] Sum_reg;
	
	input wire Clk;
	input wire [1:0] A,B;
	
	
	reg [1:0] A_reg, B_reg;
	wire Carry;
	wire [1:0] Sum;
	
	adder_2bit  a2b0(Carry, Sum, A_reg, B_reg);
	
	
	always@(posedge Clk)
		begin
			A_reg <= A;
			B_reg <= B;
		end
	
	
	always@(posedge Clk)
		begin
			Carry_reg <= Carry;
			Sum_reg <= Sum;
		end


endmodule
