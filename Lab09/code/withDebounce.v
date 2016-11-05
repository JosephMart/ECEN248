`timescale 1ns / 1ps
`default_nettype none

module withDebounce(LEDs, Center, Clk);

  // Instantiate 8 LEDs
  output reg [7:0] LEDs;

  // Instantiate Center (Big Knob) and Clk wire
  input wire Center, Clk;

  /*-this is a keyword we have not seen yet!*
   *-as the name implies, it is a parameter *
   * that can be changed at compile time... */
  parameter n = 18;

  // Instantiate intermediate wires
  wire notMsb, Rst, En, Debounced;
  reg Synchronizer0, Synchronized;

  // Instantiate n wires for Count
  reg [n-1:0] Count;

  reg edge_detect0;
  wire rising_edge;

  /********************************************/
  /* Debounce circuitry!!!                    */
  /********************************************/

  // Pass signal through Two Flip Flops
  always@(posedge Clk)
    begin
      Synchronizer0 <= Center;
      Synchronized <= Synchronizer0;
    end

  // Binary Counter
  always@(posedge Clk)
      if(Rst)
          Count <= 0;
      else if(En)
          Count <= Count + 1;

  // notMsb is NOT of most significant bit of Count
  assign notMsb = ~Count[n-1];
  // Enable is notMsb AND Synchronized
  assign En = notMsb & Synchronized;
  // Reset is NOT Synchronized
  assign Rst = ~Synchronized;
  // Debounced is most significant bit of Count
  assign Debounced = Count[n-1];

  /********************************************/
  /* End of Debounce circuitry!!!             */
  /********************************************/

  always@(posedge Clk)
      edge_detect0 <= Debounced;

  // Determine if it is  a rising edge
  assign rising_edge = ~edge_detect0 & Debounced;

  // If rising edgs, light up the next LEDs
  always@(posedge Clk)
      if(rising_edge)
          LEDs <= LEDs + 1;

endmodule
