`timescale 1ns / 1ps
module summation_unit(S, P, C);
  // Ports are wires becasue we will use dataflow
  output wire [15:0] S; // sum vector
  input wire [15:0] P, C;

  // Summation Unit Logic
  assign #2 S = P ^ C;
endmodule
