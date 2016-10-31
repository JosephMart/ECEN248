`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:32 10/31/2016 
// Design Name: 
// Module Name:    top_level 
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
module top_level (LEDs, SWs, North, South, FastClk);

  // All ports will be wires
	output wire [4:0] LEDs;
	input wire FastClk, North, South;
	input wire [1:0] SWs;

  wire [3:0] Clocks;
  reg SlowClk; // will use an always blcok for mux

  // behavioral description of a mux which selects
  // between the four available clock signals
  always @ ( * ) begin
    case (SWs) // SWs is a 2-bit bus
      2'b00: SlowClk = Clocks[0]; // use blcoking statemnt for
                                  // combinational logic
		2'b01: SlowClk = Clocks[1];
		2'b10: SlowClk = Clocks[2];
		2'b11: SlowClk = Clocks[3];
      // finish this up

      // default: ;
    endcase
  end

  // instantiate your up_counter here
  // Hint: if you want to wire a port to just the first 4
  // bits of a bus, you can do something like this: LEDs[3:0]
	up_counter upCount (LEDs[3:0], LEDs[4], North, SlowClk, South);

  // instantiate the clock divider
  clock_divider clk_div0(
      .ClkOut(Clocks),
      .ClkIn(FastClk)
    );

endmodule // top_level
