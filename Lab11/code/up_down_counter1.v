`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:35 11/14/2016 
// Design Name: 
// Module Name:    up_down_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module up_down_counter(
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
        Count <= Count +1;
      end
    else if (Down)
    // DO something similiar to counting Down
		if (Count == 0)
			Count <= 19;
		else
			Count <= Count - 1;
	end
    
endmodule // up_down_counter
