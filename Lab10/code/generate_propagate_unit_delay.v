`timescale 1ns / 1ps
module generate_propagate_unit(G, P, X, Y);
  // Ports are wires as we will use dataflow
  output wire [15:0] G, P;
  input wire [15:0] X, Y;

  // Generate Propagate Unit Logice
  assign #2 G = X & Y;
  assign #2 P = X ^ Y;
endmodule
