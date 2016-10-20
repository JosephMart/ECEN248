`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Design Name:
// Module Name:		two_one_mux_behavioral
// Author:
//
//////////////////////////////////////////////////////

module two_one_mux(Y, A, B, S);
    /*output and input ports*/
    output reg Y;

    input wire A;
    input wire B;
    input wire S;


    always@(A or B or S)
   	 begin
   		 if(S == 1'b0)
   			 Y = A;
   		 else
   			 Y = B;
   	 end
endmodule
