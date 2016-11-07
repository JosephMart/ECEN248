// This module describes the Carry Generate/Propaget
// Unit for a 4-bit carry-lookahead addition
module generate_propagate_unit(G, P, X, Y);

  // Ports are wires as we will use dataflow
  output wire [3:0] G, P;
  input wire [3:0] X, Y;

  assign G[0] = X[0] && Y[0];
  assign G[1] = X[1] && Y[1];
  assign G[2] = X[2] && Y[2];
  assign G[3] = X[3] && Y[3];

  assign P[0] = X[0] ^ Y[0];
  assign P[1] = X[1] ^ Y[1];
  assign P[2] = X[2] ^ Y[2];
  assign P[3] = X[3] ^ Y[3];

endmodule // generate_propagate_unit
