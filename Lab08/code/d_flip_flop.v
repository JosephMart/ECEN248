`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////
// Create Date: 15:44:29 10/24/2016
// Module Name: d_flip_flop
// Author Name: Joseph Martinsen
//
////////////////////////////////////////////////////////////////
module d_flip_flop (Q, notQ, Clk, D);
  output wire Q, notQ;
  input wire Clk, D;

  // Internal nets
  wire notClk, notNotClk;
  wire Q_m; // Output of master latch
  // notQ_m will be wired to the d_latch but then left
  // unconnected from there
  wire notQ_m;

  // Strcutual level wiring
  // Instantiate and wire up the not gates here...
  not #2 not0(notClk, Clk);
  not #2 not1(notNotClk, notClk);

  // Instantiate and wire up the d latches based
  // on schematic in lab
  d_latch dlMaster(Q_m, notQ_m, notClk, D);
  d_latch dlSlave(Q, notQ, notNotClk, Q_m);
endmodule // d_flip_flop
