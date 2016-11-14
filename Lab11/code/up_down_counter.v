module up_down_counter (
  output reg [4:0] Count,
  input wire Up, Down,
  input wire Clk, South
  );

  always @ (posedge Clk) begin
    if (South)
      Count <= 0;
    else if (Up)
      begin
      if (Count == 19)
        Count <= 0;
      else
        Count <= Count +1
      end
    else if (Down)
    // DO something similiar to counting Down
    
endmodule // up_down_counter
