`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:36 11/07/2016 
// Design Name: 
// Module Name:    summation_unit 
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
module summation_unit(S, P, C);

	// Ports are wires becasue we will use dataflow
  output wire [15:0] S; // sum vector
  input wire [15:0] P, C;

  assign #2 S = P ^ C;
  //assign  #2 S[1] = P[1] ^ C[1];
  //assign  #2 S[2] = P[2] ^ C[2];
  //assign  #2 S[3] = P[3] ^ C[3];
  
endmodule
