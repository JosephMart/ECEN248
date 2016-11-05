`timescale 1ns / 1ps

module switch_bounce(
    input wire Center,
    output wire J1_0
    );

    // Assign the output from FBGA board to an input Center wire
    assign J1_0 = Center;

endmodule
