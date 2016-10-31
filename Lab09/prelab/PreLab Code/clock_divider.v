module clock_divider (ClkOut, ClkIn);
  /* output port needs to be a reg because we will drive it with *
  a behavioral statement */
  output wire [3:0] ClkOut;
  input wire ClkIn; // wires can drive regs

  /*-this is a keyword we ahve not seen yet!*
  as the name implies, it is a parameter that
  can be changed at compile time...*/
  parameter n = 5; // make count 5-bits for now

  reg [n-1:0] Count; //count bit width is based on n! how cool is that!

  //simple behavioral construct to describe a counter
  always @ ( posedge ClkIn ) begin
    Count <= Count + 1;
  end

  // Now we need to wire up our ClkOut which is a 4-bit wire
  // Wire up to most signficant bit
  assign ClkOut[3:0] = Count[n-1:n-4];

endmodule // clock_divider
