`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:20 10/24/2016 
// Design Name: 
// Module Name:    sr_latch 
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

module sr_latch (Q, notQ, En, S, R);
  // All ports should be wires
  output wire Q, notQ;
  input wire En, S, R;

  // Intermediate nets
  wire nandSEN, nandREN;

  // woah!!! what is this #2 thing?!?
  // it's a delay (simulation only!!!)
  nand #4 nand0(Q, nandSEN, notQ); //2ns gate delay
  // finish things up here...
  nand #4 nand1(notQ, nandREN, Q);
  nand #4 nand2(nandSEN, S, En);
  nand #4 nand3(nandREN, R, En);
  
endmodule // sr_latch