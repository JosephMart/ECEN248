`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 14:49:20 10/24/2016
// Module Name: sr_latch
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////

module sr_latch (Q, notQ, En, S, R);
  // All ports should be wires
  output wire Q, notQ;
  input wire En, S, R;

  // Intermediate nets
  wire nandSEN, nandREN;

  // 4ns delay
  nand #4 nand0(Q, nandSEN, notQ);
  // finish things up here...
  nand #4 nand1(notQ, nandREN, Q);
  nand #4 nand2(nandSEN, S, En);
  nand #4 nand3(nandREN, R, En);
endmodule // sr_latch
