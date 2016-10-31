module top_level (LEDs, SWs, North, South, FastClk);

  // All ports will be wires


  wire [3:0] Clocks;
  reg SlowClk; // will use an always blcok for mux

  // behavioral description of a mux which selects
  // between the four available clock signals
  always @ ( * ) begin
    case (SWs) // SWs is a 2-bit bus
      2'b00: SlowClk = Clocks[0]; // use blcoking statemnt for
                                  // combinational logic
      // finish this up

      default: ;
    endcase
  end

  // instantiate your up_counter here
  // Hint: if you want to wire a port to just the first 4
  // bits of a bus, you can do something like this: LEDs[3:0]


  // instantiate the clock divider
  clock_divider clk_div0(
      .ClkOut(Clocks),
      .ClkIn(FastClk)
    );

endmodule // top_level
