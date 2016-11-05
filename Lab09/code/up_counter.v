`timescale 1ns / 1ps

module up_counter (Count, Carry3, En, Clk, Rst);
	// Instantiate Wires and Reg
	output reg [3:0] Count;
	output wire Carry3;
	input wire En, Clk, Rst;

	//intermediate nets
	wire [3:0] Carry, Sum;

	// Instantiate and wire up 4 half-adders
	half_adder ha0(Sum[0], Carry[0], En, Count[0]);
	half_adder ha1(Sum[1], Carry[1], Carry[0], Count[1]);
	half_adder ha2(Sum[2], Carry[2], Carry[1], Count[2]);
	half_adder ha3(Sum[3], Carry[3], Carry[2], Count[3]);

	// Wire up carry 3
	assign Carry3 = Carry[3];
	// Positve edge triggered flip-flops for count
	always @ ( posedge Clk or posedge Rst ) begin
		if (Rst) begin //if RST == 1`b1
			Count <= 0;
		end else begin //otherwise latch sum
			Count <= Sum;
		end
	end
endmodule
