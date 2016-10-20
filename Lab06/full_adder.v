`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////
// Create Date:	16:06:23 10/10/2016
// Module Name:	full_adder
// Author: Joseph M Martinsen
//
//////////////////////////////////////////////////////////////
module full_adder(S, Cout, A, B, Cin );
    // Declare input and output ports
    input wire A;
    input wire B;
    input wire Cin;
    output wire S
    output wire Cout;

    // Declare wires
    wire andBCin;
    wire andACin;
    wire andAB;

    // Use dataflow to create gatelevel commands
    assign S = A ^ B ^ Cin; // A XOR B XOR Cin
    assign andAB = A & B; // A AND B
    assign andBCin = B & Cin; // B AND Cin
    assign andACin = A & Cin; // A AND Cin
    // andAB OR andBCin OR andACin
    assign Cout = andAB | andBCin | andACin;
endmodule
