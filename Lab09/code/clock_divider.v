`timescale 1ns / 1ps
`default_nettype none

module clock_divider (ClkOut, ClkIn);
  // Output port needs to be a reg because we will drive it with
  // a behavioral statement
  output wire [3:0] ClkOut;
  input wire ClkIn; // wires can drive regs

  // This is is a parameter that
  // can be changed at compile time.
  parameter n = 26;

  // Count bit width is based on n
  reg [n-1:0] Count;

  // Simple behavioral construct to describe a counter
  always @ ( posedge ClkIn ) begin
    Count <= Count + 1;
  end

  // Now we need to wire up our ClkOut which is a 4-bit wire
  // Wire up to most signficant bit
  assign ClkOut[3:0] = Count[n-1:n-4];

endmodule // clock_divider
