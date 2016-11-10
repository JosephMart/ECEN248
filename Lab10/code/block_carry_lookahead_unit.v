`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:52 11/07/2016 
// Design Name: 
// Module Name:    block_carry_lookahead_unit 
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
module block_carry_lookahead_unit(G_star, P_star, C, G, P, C0);
	// Ports are wires because we will use dataflow
  output wire G_star, P_star;
  output wire [3:1] C; // C3, C2, C1
  input wire [3:0] G, P;
  input wire C0; // Input carry

  assign #2 G_star = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

  assign #2 P_star = P[3] & P[2] & P[1] & P[0];
  
  assign #2 C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
  
  assign #2 C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
  
  assign #2 C[1] = G[0] | (P[0] & C0);

endmodule
