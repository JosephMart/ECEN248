// This module describes the block carry-lookahead unit
// for a 2-level carry-lookahead adder
module block_carry_lookahead_unit (G_star, P_star, C, G, P, C0);
  // Ports are wires because we will use dataflow
  output wire G_star, P_star;
  output wire [3:1] C; // C3, C2, C1
  input wire [3:0] G, P;
  input wire C0; // Input carry

  assign G_star = G[3] || (P[3] & G[2]) || (P[3] & P[2] & G[1]) || (P[3] & P[2] & P[1] & G[0]);

  assign P_star = P[3] & P[2] & P[1] & P[0];

endmodule // block_carry_lookahead_unit
