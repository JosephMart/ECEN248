`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Module Name:		two_four_decoder
// Author: Joseph Martinsen
//
//////////////////////////////////////////////////////

module two_four_decoder(
    // Input/Output Ports
   	 input wire [1:0] W,
   	 input wire En,
   	 output reg [3:0] Y
	);

    // Behavioral logic for 2:4 Decoder
     always@ (En or W)
   	 begin
   		 if(En == 1'b1)
   			 case(W)
   			  2'b00: Y = 4'b0001;
   			  2'b01: Y = 4'b0010;
   			  2'b10: Y = 4'b0100;
   			  2'b11: Y = 4'b1000;
   			 endcase
   		 else
   			 Y = 4'b0000;
   	 end
endmodule
