`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Module Name:		priority_encoder
// Author: Joseph Martinsen
//
//////////////////////////////////////////////////////
module priority_encoder(input wire [3:0] W, // Input/Ouput prots
    output wire zero,
    output reg [1:0] Y
    );

    // Assign value when W has no change
    assign zero = (W == 4'b0000);

    // Behavioral logic for Priority Encoder
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
