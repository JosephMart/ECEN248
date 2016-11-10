`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:54 11/07/2016 
// Design Name: 
// Module Name:    generate_propagate_unit 
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
module generate_propagate_unit(G, P, X, Y);
	// Ports are wires as we will use dataflow
  output wire [15:0] G, P;
  input wire [15:0] X, Y;

  //assign G[0] = X[0] & Y[0];
  //assign G[1] = X[1] & Y[1];
  //assign G[2] = X[2] & Y[2];
  //assign G[3] = X[3] & Y[3];
	assign #2 G = X & Y;
  //assign P[0] = X[0] ^ Y[0];
  //assign P[1] = X[1] ^ Y[1];
  //assign P[2] = X[2] ^ Y[2];
  //assign P[3] = X[3] ^ Y[3];
  assign #2 P = X ^ Y;
endmodule
