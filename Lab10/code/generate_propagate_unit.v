`timescale 1ns / 1ps
module generate_propagate_unit(G, P, X, Y);
  // Ports are wires as we will use dataflow
  output wire [3:0] G, P;
  input wire [3:0] X, Y;

  // Generate Propagate Unit Logice
  assign G = X & Y;
  assign P = X ^ Y;
endmodule
