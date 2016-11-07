// This module describes the 4-bit summation Unit
// for a carry-lookahead adder

module summation_unit (S, P, C);

  // Ports are wires becasue we will use dataflow
  output wire [3:0] S; // sum vector
  input wire [3:0] P, C;

  assign  S[0] = P[1] ^ C[1];
  assign  S[2] = P[2] ^ C[2];
  assign  S[3] = P[3] ^ C[3];
  assign  S[4] = P[4] ^ C[4];

endmodule // summation_unit
