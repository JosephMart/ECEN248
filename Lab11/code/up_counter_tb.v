`timescale 1ns / 1ps

module up_counter_tb;

	/* Inputs */
	reg En;
	reg Clk;
	reg Rst;

	/* Outputs */
	wire [3:0] Count;
	wire Carry3;

	/* Instantiate the Unit Under Test (UUT) */
	up_counter uut (
		.Count(Count), 
		.Carry3(Carry3), 
		.En(En), 
		.Clk(Clk), 
		.Rst(Rst)
	);

	/*generate Clk signal*/
	always
		#5 Clk <= ~Clk;
	
	initial begin
		/* Initialize Inputs */
		En = 0;
		Clk = 0;
		Rst = 1; //Reset is active HIGH

		// Wait 20 ns for global reset to finish
		#20;
        
		Rst = 0;
		
		#20; //test hold when En is low...
		En = 1;//let it count away...

	end
      
endmodule

