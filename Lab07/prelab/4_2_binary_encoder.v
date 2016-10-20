`timescale 1ns / 1ps
`default_nettype none
///////////////////////////////////////////////////////
// Module Name:	4_2_binary_encoder
// Author: Joseph M Martinsen
//
///////////////////////////////////////////////////////
module four_two_encoder (W,Y,zero);
  // Declare output wires
  output wire [1:0] Y;
  output wire zero;
  //Declare input wires
  input wire [3:0] W ;
  // Assign logic values for output wires
  assign Y[0] = W[1] | W[3];
  assign Y[1] = W[2] & W[3];
  assign zero = ~W[0] & ~W[1] & ~W[2] & ~W[3];
endmodule
