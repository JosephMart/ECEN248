`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Design Name:
// Module Name:	four_bit_mux_behavioral
// Author:
//
//////////////////////////////////////////////////////
module four_bit_mux(Y, A, B, S);
    /*output and input ports*/
    output reg [3:0]Y;

    input wire [3:0]A;
    input wire [3:0]B;
    input wire S;


    always@(A or B or S)
   	 begin
   		 if(S == 1'b0)
   			 Y = A;
   		 else
   			 Y = B;
   	 end
endmodule
