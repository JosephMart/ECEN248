`timescale 1ns / 1ps

module up_down_counter(
  output reg [4:0] Count,
  input wire Up, Down,
  input wire Clk, South
  );

  always @ (posedge Clk) begin
// If south button press, reset count
    if (South)
      Count <= 0;
    else if (Up)
      begin
    //If rotating up add 1, if 19, reset
      if (Count == 19)
        Count <= 0;
      else
        Count <= Count +1;
      end
    else if (Down)
    //If rotating down subtract 1, if 0, go to 19
      if (Count == 0)
        Count <= 19;
      else
        Count <= Count - 1;
end

endmodule // up_down_counter
