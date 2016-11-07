// This module describes the 4-bit carry-lookahead Unit
// for a carry-lookahead addaer
module carry_lookahead_unit (C, G, P, C0);
  // Ports are wires because we will use dataflow
  output wire [4:1] C; // C4, C3, C2, C1
  input wire [3:0] G, P; // Generates and propagates
  input wire C0; // input carry

  assign C[1] = G[0] || (P[0] && C0);
  assign C[2] = G[1] || (P[1] && C[1]);
  assign C[3] = G[2] || (P[2] && C[2]);
  assign C[4] = G[3] || (P[3] && C[3]);

endmodule // carry_lookahead_unit
