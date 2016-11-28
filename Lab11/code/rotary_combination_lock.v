/*This is the top-level module for our digital *
 *rotary combination-lock based on the diagram *
 *provide in the lab manual                    */

module rotary_combination_lock(
    /*LCD interface wires make up our output!*/
    output wire LCD_E, LCD_RW, LCD_RS,
    output wire [3:0] SF_D,
    /*Let's output state for debugging!*/
    output wire [2:0] J1,
    input Clk,
    /*the buttons and rotary encoder outputs*
     *provide input to our top-level circuit*/
    input Center,
    input South,
    input wire rotA, rotB
);

    /*intermediate nets*/
    wire CenterSync, SouthSync;
    wire Right, Left;
    wire Locked;
    wire [4:0] Count;

    /*synchronize button inputs*/
    synchronizer syncA(CenterSync, Center, Clk);
    synchronizer syncB(SouthSync, South, Clk);

    /*wire up rotary encoder module*/
    rotary_encoder_module U0(
         .Left(Left),
         .Right(Right),
         .Clk(Clk),
         .rotA(rotA),
         .rotB(rotB)
    );

    /*wire up combination lock FSM*/
    combination_lock_fsm U1(
         .Locked(Locked),
         .Right(Right),
         .state(J1),
         .Left(Left),
         .Center(CenterSync),
         .Clk(Clk),
         .South(SouthSync),
         .Count(Count)
    );

    /*instantiate up down counter*/
    up_down_counter U2(
        .Count(Count),
        .Up (Left),
        .Down(Right),
        .Clk(Clk),
        .South(South)
    );

    /*hook up LCD driver*/
    lcd_driver U3(Clk, South, Count, Locked, SF_D, LCD_E,
        LCD_RS, LCD_RW);

endmodule
