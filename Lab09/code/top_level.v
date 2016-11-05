`timescale 1ns / 1ps

module top_level (LEDs, SWs, North, South, FastClk);
  // All ports will be wires
	output wire [4:0] LEDs;
	input wire FastClk, North, South;
	input wire [1:0] SWs;

	// Intermediate Nets
  wire [3:0] Clocks;
  reg SlowClk; // will use an always blcok for mux

  // behavioral description of a mux which selects
  // between the four available clock signals
  always @ ( * ) begin
    case (SWs) // SWs is a 2-bit bus
			// Combinational logic
			2'b00: SlowClk = Clocks[0];
			2'b01: SlowClk = Clocks[1];
			2'b10: SlowClk = Clocks[2];
			2'b11: SlowClk = Clocks[3];
    endcase
  end

  // Instantiate Up Counter
	up_counter upCount (LEDs[3:0], LEDs[4], North,
		 SlowClk, South);

  // Instantiate the clock divider
  clock_divider clk_div0(
      .ClkOut(Clocks),
      .ClkIn(FastClk)
    );
endmodule // top_level
