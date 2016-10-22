`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Module Name:		two_one_mux_behavioral
// Author: Joseph Martinsen
//
//////////////////////////////////////////////////////

module two_one_mux(Y, A, B, S);
    /*output and input ports*/
    output reg Y;

    input wire A;
    input wire B;
    input wire S;

    // 2:1 Behavioral Mux
    always@(A or B or S)
   	 begin
   		 if(S == 1'b0)
   			 Y = A;
   		 else
   			 Y = B;
   	 end
endmodule
