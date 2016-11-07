// This is the top-level module for a 4-bit
// carry-lookahead addaer

module carry-lookahead_4bit (Cout, S, X, Y, Cin);

  // Ports are wires because we are using structual
  output wire Cout; // C4 for a 4-bit adder
  output wire [3:0] S; // final 4-bit sum vector
  input wire [3:0] X, Y; // the 4-bit addends
  input wire Cin; // input carry

  // Intermediete wires
  wire [3:0] G, P;
  wire [3:1] C;

  // generate_propagate_unit(G, P, X, Y);
  generate_propagate_unit gpu0(G[0], P[0], X[0], Y[0]);
  generate_propagate_unit gpu1(G[1], P[1], X[1], Y[1]);
  generate_propagate_unit gpu2(G[2], P[2], X[2], Y[2]);
  generate_propagate_unit gpu3(G[3], P[3], X[3], Y[3]);

  // carry_lookahead_unit (C, G, P, C0);
  carry_lookahead_unit clu0(C[1], G[0], P[0], Cin);
  carry_lookahead_unit clu1(C[2], G[1], P[1], C[1]);
  carry_lookahead_unit clu2(C[3], G[2], P[2], C[2]);
  carry_lookahead_unit clu3(Cout, G[3], P[3], C[3]);

  // summation_unit (S, P, C);
  summation_unit su0(S[0], P[0], C[0]);
  summation_unit su1(S[1], P[1], C[1]);
  summation_unit su2(S[2], P[2], C[2]);
  summation_unit su3(S[3], P[3], C[3]);

endmodule // carry-lookahead_4bit
