`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Design Name:
// Module Name:		priority_encoder
// Author:
//
//////////////////////////////////////////////////////
module priority_encoder(input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
    );

    assign zero = (W == 4'b0000);

    always@(W)
   	 begin
   		 casex(W)
   			 4'b0001: Y = 2'b00;
   			 4'b001X: Y = 2'b01;
   			 4'b01XX: Y = 2'b10;
   			 4'b1XXX: Y = 2'b11;
   			 default: Y = 2'bXX;
   		 endcase
   	 end

endmodule
