`timescale 1ns / 1ps

module combination_lock_fsm(output reg [2:0] state,
  output wire Locked, // asserted when locked
  input wire Right, Left, // indicate direction
  input wire [4:0] Count, // indicate position
  input wire Center, // the unlock button
  input wire Clk, South // clock and reset
  );
  // Parameters for the 4 cases
  parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b100,

  reg [2:0] nextState;

  always @ ( * ) begin
    case (state)
      S0: begin
        if (Right)
            nextState = S1;
        else
            nextState = S0;
        end
      S1: begin
        if (Left)
        // If digit is 13
            if(Count == 5'b01101)
                nextState = S2;
            else
                nextState = S0;
            else
                nextState = S1;
        end
      S2: begin
        if (Right)
        // If digit is 7
            if (Count == 5'b00111)
                nextState = S3;
            else
                nextState = S0;
        else
            nextState = S2;
        end
      S3: begin
        if (Left)
        // If digit is 17
            if (Count == 5'b10001)
                nextState = S4;
            else
                nextState = S0;
        else
            nextState = S3;
        end
      S4: begin
        nextState = S4;
        end

default: begin
nextState = S0;
end
    endcase
  end
    // If state S$ then unlock
    assign Locked = (state == S4) ? 0:1;

    always@ (posedge Clk)
        if (South)
            state <= S0;
        else
            state <= nextState;
endmodule // combination_lock_fsm
