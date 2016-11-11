`timescale 1ns / 1ps
module carry_lookahead_16bit(Cout, S, X, Y, Cin);
  // Ports are wires as we will use structual
  output wire Cout; // C_16 for a 16-bit adder
  output wire [15:0] S; // final 16-bit sum vector
  input wire [15:0] X, Y; // the 16-bit addends
  input wire Cin;

  // Intermediate nets
  wire [16:0] C; // 17-bit carry vector
  wire [15:0] P, G; // 16 bit generate and propagate vectors
  wire [3:0] P_star, G_star; // block gens and props

  assign C[0] = Cin;

  // Instantiate Modules
  generate_propagate_unit gpu (G, P, X, Y);

  block_carry_lookahead_unit BLCAU0(
    .G_star (G_star[0]),
    .P_star (P_star[0]),
    .C (C[3:1]),
    .G (G[3:0]),
    .P (P[3:0]),
    .C0 (C[0])
    );

  block_carry_lookahead_unit BLCAU1(
    .G_star (G_star[1]),
    .P_star (P_star[1]),
    .C (C[7:5]),
    .G (G[7:4]),
    .P (P[7:4]),
    .C0 (C[4])
    );

  block_carry_lookahead_unit BLCAU2(
    .G_star (G_star[2]),
    .P_star (P_star[2]),
    .C (C[11:9]),
    .G (G[11:8]),
    .P (P[11:8]),
    .C0 (C[8])
    );

  block_carry_lookahead_unit BLCAU3(
    .G_star (G_star[3]),
    .P_star (P_star[3]),
    .C (C[15:13]),
    .G (G[15:12]),
    .P (P[15:12]),
    .C0 (C[12])
    );

  carry_lookahead_unit CLAU(
    .C ({C[16], C[12], C[8], C[4]}),
    .G (G_star),
    .P (P_star),
    .C0 (C[0])
    );

  summation_unit su(S,P,C[15:0]);

  assign Cout = C[16];
endmodule
