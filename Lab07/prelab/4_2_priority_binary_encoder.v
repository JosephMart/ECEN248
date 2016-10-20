module priority_encoder(
  input wire [3:0] W,
  output wire [1:0 ] Y,
  output wire zero)

  wire [3:0] i;

  assign i[0] = ~W[3] & ~ W[2] & ~ W[1] & W[0];
  assign i[1] = ~W[3] & ~ W[2] & W[1];
  assign i[2] = ~W[3] & W[2];
  assign i[3] = W[3];

  four_two_encoder 4_2_enc (i,Y,zero);

endmodule
