`timescale 1ns / 1ps
`default_nettype none
///////////////////////////////////////////////////////
// Create Date:	15:52:35 10/10/2016
// Module Name:	four_bit_mux
// Author: Joseph M Martinsen
//
///////////////////////////////////////////////////////
module four_bit_mux(Y,A,B,S);
    // Declare output and input prots
    output wire [3:0] Y; // Y output wire is 4 bit wide
    input wire [3:0] A, B; // A and B are 4-bit wires
    input wire S; // Select wire is 1 bit wide wire

    // Initialize user-defined 2:1 MUX modules
    two_one_mux MUX0(Y[0], A[0], B[0], S);
    two_one_mux MUX1(Y[1], A[1], B[1], S);
    two_one_mux MUX2(Y[2], A[2], B[2], S);
    two_one_mux MUX3(Y[3], A[3], B[3], S);
endmodule
