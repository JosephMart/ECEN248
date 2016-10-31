module half_adder (
  output S,
  output Cout,
  input A,
  input B
  );

  wire S, Cout;
  assign S = A^B;
  assign Cout = A&B;

endmodule // half_adder
