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
  wire [4:1] C;

  // generate_propagate_unit(G, P, X, Y);
  generate_propagate_unit gpu(G, P, X, Y);

  // carry_lookahead_unit (C, G, P, C0);
  carry_lookahead_unit clu(C, G, P, Cin);

  // summation_unit (S, P, C);
  summation_unit su(S, P, C);

  assign Cout = C[4];
endmodule // carry-lookahead_4bit
