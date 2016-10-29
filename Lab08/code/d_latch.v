`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 15:27:40 10/24/2016
// Module Name: d_latch
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////

module d_latch(Q, notQ, En, D);
  // Declare Wires
   output wire Q;
   output wire notQ;
   input wire En;
   input wire D;

   // Declare Intermidiate Wires
   wire Dnot;
   wire nandDnotEN;
   wire Dn1;

   // Structual Logic for D-Latch
	not #2 (Dnot, D);
	nand #2 nand0(nandDEN, D, En); //2ns gate delay
	nand #2 nand1(Q, nandDEN, notQ);
	nand #2 nand2 (nandDnotEN, Dnot, En);
	nand #2 nand3 (notQ, Q, nandDnotEN);
endmodule // d_latch
