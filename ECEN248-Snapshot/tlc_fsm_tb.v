`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:44 11/30/2012
// Design Name:   tlc_fsm
// Module Name:   /homes/grad/atarghe1/ecen248/lab11/tlc_fsm_tb.v
// Project Name:  lab11
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tlc_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tlc_fsm_tb;

	// Inputs
	reg [7:0] Count;
	reg Clk;
	reg Rst;

	// Outputs
	wire [2:0] state;
	wire RstCount;
	wire [1:0] highwaySignal;
	wire [1:0] farmSignal;

	// Instantiate the Unit Under Test (UUT)
	tlc_fsm uut (
		.state(state), 
		.RstCount(RstCount), 
		.highwaySignal(highwaySignal), 
		.farmSignal(farmSignal), 
		.Count(Count), 
		.Clk(Clk), 
		.Rst(Rst)
	);
     
     /*generate clock*/
     always
          #5 Clk = ~Clk;

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 1;
          
          #10;
          Rst = 0; //release reset
          #300;
          $stop;

	end
     
         /*describe Counter with asyncrhonous reset*/
    always@(posedge Clk )
        if(RstCount)
            Count <= 0;
        else
            Count <= Count + 1;

      
endmodule

