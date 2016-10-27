`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:40 10/24/2016 
// Design Name: 
// Module Name:    d_latch 
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

module d_latch(Q, notQ, En, D);
   output wire Q;
   output wire notQ;
   input wire En;
   input wire D;

   wire Dnot;
   wire nandDnotEN;
   wire Dn1;

	not #2 (Dnot, D);
	nand #2 nand0(nandDEN, D, En); //2ns gate delay
	nand #2 nand1(Q, nandDEN, notQ);
	nand #2 nand2 (nandDnotEN, Dnot, En);
	nand #2 nand3 (notQ, Q, nandDnotEN);
endmodule // d_latch