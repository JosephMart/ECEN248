`timescale 1ns / 1ps
`default_nettype none

module half_adder (S,Cout, A,B);

  output wire S, Cout;
  input wire A, B;
  
  assign S = A^B;
  assign Cout = A&B;

endmodule // half_adder
