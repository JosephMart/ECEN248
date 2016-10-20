`timescale 1ns / 1ps
`default_nettype none
///////////////////////////////////////////////////////
// Create Date:	15:21:04 10/10/2016
// Module Name:	two_one_mux
// Author: Joseph M Martinsen
//
///////////////////////////////////////////////////////
module two_one_mux(Y, A, B, S);
    //declare output and input wires
    output wire Y;
    input wire A, B, S;

    // Declare internal nets
    wire notS; // Wire to carry not S
    wire andA; // Wire to carry andA
    wire andB; // Wire to carry andB

    // instatiate gate-level modules
    not not0(notS, S); // invert S
    and and0(andA, notS, A); // and of notS and A
    and and1(andB, S, B); // and of S and B
    or or0(Y, andA, andB); // or andA and and B
endmodule
