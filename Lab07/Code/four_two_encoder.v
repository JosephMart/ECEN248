`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Module Name:		four_two_encoder
// Author: Joseph Martinsen
//
//////////////////////////////////////////////////////
module four_two_encoder(
    // Input and output ports
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
    );

    // Assign case for no W
    assign zero = (W == 4'b0000);

    // Behavioral logci for 4:2 Encoder
    always@(W)
   	 begin
   		 case(W)
   			 4'b0001: Y = 2'b00;
   			 4'b0010: Y = 2'b01;
   			 4'b0100: Y = 2'b10;
   			 4'b1000: Y = 2'b11;
   			 default: Y = 2'bXX;
   		 endcase
   	 end

endmodule
