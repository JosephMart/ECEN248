`timescale 1ns / 1ps
`default_nettype none

module withDebounce(LEDs, Center, Clk);

    output reg [7:0] LEDs;
    
    input wire Center, Clk;

    /*-this is a keyword we have not seen yet!*
     *-as the name implies, it is a parameter *
     * that can be changed at compile time... */
    parameter n = 18;

    wire notMsb, Rst, En, Debounced;
    reg Synchronizer0, Synchronized;
    reg [n-1:0] Count;

    reg edge_detect0;
    wire rising_edge;
    
   /********************************************/
   /* Debounce circuitry!!!                    */ 
   /********************************************/
    
    always@(posedge Clk)
      begin
        Synchronizer0 <= Center;
        Synchronized <= Synchronizer0;
      end

    always@(posedge Clk)
        if(Rst)
            Count <= 0;
        else if(En)
            Count <= Count + 1;

    assign notMsb = ~Count[n-1];
    assign En = notMsb & Synchronized;
    assign Rst = ~Synchronized;
    assign Debounced = Count[n-1];

   /********************************************/
   /* End of Debounce circuitry!!!             */ 
   /********************************************/

    always@(posedge Clk)
        edge_detect0 <= Debounced;
    assign rising_edge = ~edge_detect0 & Debounced;

    always@(posedge Clk)
        if(rising_edge)
            LEDs <= LEDs + 1;

endmodule

