`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:03 11/07/2016 
// Design Name: 
// Module Name:    carry_lookahead_4bit 
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
module carry_lookahead_4bit(Cout, S, X, Y, Cin);
// Ports are wires because we are using structual
  output wire Cout; // C4 for a 4-bit adder
  output wire [3:0] S; // final 4-bit sum vector
  input wire [3:0] X, Y; // the 4-bit addends
  input wire Cin; // input carry

  // Intermediete wires
  wire [3:0] G, P;
  wire [4:0] C;
  assign C[0] = Cin;

  // generate_propagate_unit(G, P, X, Y);
  generate_propagate_unit gpu(G, P, X, Y);

  // carry_lookahead_unit (C, G, P, C0);
  carry_lookahead_unit clu(C[4:1], G, P, Cin);

  // summation_unit (S, P, C);
  summation_unit su(S, P, C[3:0]);

  assign Cout = C[4];

endmodule
