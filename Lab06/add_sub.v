`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////
// Create Date:	16:24:12 10/10/2016
// Module Name:	add_sub
// Author: Joseph M Martinsen
//
//////////////////////////////////////////////////////////////
module add_sub(
   	 //Declare output and input
   	 output wire [3:0] Sum, // 4-bit Results
   	 output wire Overflow, // 1-bit wire for overflow
   	 input wire [3:0] opA, opB, // 4-bit opperands
   	 input wire opSel // if opSel =1, then subtractadd_sub
);
    // declare internal nets
    wire [3:0] notB;
    wire c0, c1, c2, c3;

    // Create complement logic
    assign notB[0] = opB[0] ^ opSel;
    assign notB[1] = opB[1] ^ opSel;
    assign notB[2] = opB[2] ^ opSel;
    assign notB[3] = opB[3] ^ opSel;

    // full adders to create a ripple carry adder
    full_adder adder0(Sum[0], c0, opA[0], notB[0], opSel);
    full_adder adder1(Sum[1], c1, opA[1], notB[1], c0);
    full_adder adder2(Sum[2], c2, opA[2], notB[2], c1);
    full_adder adder3(Sum[3], c3, opA[3], notB[3], c2);

    // Overflow detection logic
    assign Overflow = c2 ^ c3;
endmodule
