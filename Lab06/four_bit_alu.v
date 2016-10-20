`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////
// Create Date:	16:47:31 10/10/2016
// Module Name:	four_bit_alu
// Author: Joseph M Martinsen
//
//////////////////////////////////////////////////////////////
module four_bit_alu(
    output wire [3:0] Result, // 4-bit output
    output wire Overflow, // 1-bit overflow
    input wire [3:0] opA, opB, // 4-bit operands
    input wire [1:0] ctrl // 2 bit operation select
	);
     wire [3:0] Sum; // 4-bit Sum wire
     wire [3:0] andAB; // 4-bit A AND B wire
     wire add_sub0; // Not sure if this was used...
     wire OverflowInit; // Temp Overflow wire
     // Initialize addsub Module
     add_sub addsub(Sum, OverflowInit, opA, opB, ctrl[1]);

      // Determine overflow logic
     assign Overflow = OverflowInit & ctrl[0];
     // Values of A AND B for each bit
     assign andAB[0] = opA[0] & opB[0];
     assign andAB[1] = opA[1] & opB[1];
     assign andAB[2] = opA[2] & opB[2];
     assign andAB[3] = opA[3] & opB[3];

     // Initialize 4-bit MUX
     four_bit_mux four_bit_mux0(Result,andAB,Sum,ctrl[0]);
endmodule
