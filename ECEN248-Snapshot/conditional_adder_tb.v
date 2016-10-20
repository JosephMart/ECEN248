`timescale 1ns / 1ps
`define STRLEN 32

module conditional_adder_tb;

   /*A task is similar to a procedure in the traditional programming language*/
   /*This particular task simply checks the output of our circuit against a 
     known answer and prints a message based on the outcome. Additionally, 
     this task increments the variable we are using to keep track of the 
     number of tests successfully passed.*/
   task passTest;
		input [9:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
    /*this task simply informs the user of the final outcome of the test*/
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask
	
	// Inputs
	reg [3:0] X;
	reg [3:0] Y;

	// Outputs
	wire Cout_1, Cout_0;
	wire [3:0] S_1, S_0;
	
	//test bench nets
    reg [4:0] Result_1;
    reg [4:0] Result_0;
	reg [7:0] passed;

	// Instantiate the Unit Under Test (UUT)
	conditional_adder uut (
		.Cout_1(Cout_1),
        .Cout_0(Cout_0),
		.S_1(S_1),
        .S_0(S_0), 
		.X(X), 
		.Y(Y)
	);

	integer i, j;	

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		passed = 0;
		
		for(i = 0; i < 16; i = i + 1)
			for(j = 0; j < 16; j = j + 1)
			 begin
				#10;
				Result_1 = X+Y+1;
                Result_0 = X+Y;
				passTest({Cout_1, S_1, Cout_0, S_0}, {Result_1, Result_0}, "4-bit Conditional Adder Unit Test", passed);
				X = i;
				Y = j;
			 end
		/*check to see if all tests passed*/
      allPassed(passed, i*j);
      $stop; //hault simulation cause we are done!
	end
      
endmodule

