`timescale 1ns / 1ps
`default_nettype none
///////////////////////////////////////////////////////
// Module Name:	2_4_binary_decoder
// Author: Joseph M Martinsen
//
///////////////////////////////////////////////////////
module two_four_decoder( Y, W, En);
   // Declare output wires
   output wire [3:0] Y

   // Declare input wires
   input wire [1:0] W,
   input wire En,

   // Assign output wire logic values
   assign Y[0] =(En & ~W[1] & ~W[0]);
   assign Y[1] =(En & ~W[1] & W[0]);
   assign Y[2] =(En & W[1] & ~W[0]);
   assign Y[3] =(En & W[1] & W[0]);
endmodule
