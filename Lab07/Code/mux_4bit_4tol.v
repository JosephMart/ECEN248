`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Module Name:		mux_4bit_4tol
// Author: Joseph Martinsen
//
//////////////////////////////////////////////////////

module mux_4bit_4to1(Y, A, B, C, D, S);
    // Input/output Ports
    output reg [3:0] Y;
    input wire [3:0] A,B,C,D;
    input wire [1:0] S;

    // Logic for 4-bit 4:1 Mux
    always@(*)
   	 case(S)
   		 2'b00: Y = A;
   		 2'b01: Y = B;
   		 2'b10: Y = C;
   		 2'b11: Y = D;
   	 endcase

endmodule
