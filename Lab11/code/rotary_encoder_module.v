`timescale 1 ns / 1 ps
`default_nettype none

/*This module takes as input the quadrature outputs *
 *A and B from the rotary encoder on the Spartan 3e *
 *board, filters out electrical chatter, and outputs*
 *a Right and a Left signal. Left pulses every 18   *
 *as the rotary shaft rotates to the left, while    *
 *Right pulses every 18 degrees as the rotary shaft *
 *rotates to the right.                             *
 *The technique describe here is provided by an     *
 *an Xilinx application engineer in a document      *
 *entitled "Rotary Encoder Interface for            *
 *Spartan-3E Starter Kit"                           */          
module rotary_encoder_module(
     output wire Left, Right,
     input Clk,
     input wire rotA, rotB
);
	
     /*internal nets*/
     wire buffA, buffB; //input buffers
     reg rotary_q1, rotary_q2;
     reg rotary_event, rotary_left;
     reg rotary_q1_old;


     /*buffer inputs*/
     synchronizer syncA(buffA, rotA, Clk);
     synchronizer syncB(buffB, rotB, Clk);
     
 
     /*elimentate bounce! The result is q1 and q2*/
     /*XNOR*/
     always@(posedge Clk)
          if(buffA & buffB)
               rotary_q1 <= 1'b1;
          else if(~buffA & ~ buffB)
               rotary_q1 <= 1'b0;
     /*XOR*/
     always@(posedge Clk)
          if(~buffA & buffB)
               rotary_q2 <= 1'b1;
          else if(buffA & ~buffB)
               rotary_q2 <= 1'b0;
    
    /*detect rising edge on q1 to signal an event*/
    always@(posedge Clk)
          rotary_q1_old <= rotary_q1;
          
     always@(posedge Clk)
          rotary_event <= ~rotary_q1_old & rotary_q1;
     
    /*determine the direction of rotation based on q1 and q2*/
     always@(posedge Clk)
          if(~rotary_q1_old & rotary_q1)
               rotary_left <= rotary_q2;
               
     /*generate Left and Right signals*/
     assign Left  = rotary_event & rotary_left;
     assign Right = rotary_event & ~rotary_left;

endmodule
