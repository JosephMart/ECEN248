`timescale 1ns / 1ps

module combination_lock_fsm_tb;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

	// Inputs
	reg Right;
	reg Left;
	reg Center;
	reg Clk;
	reg South;
	reg [4:0] Count;

	// Outputs
	wire Locked;
	wire [2:0] state;
	
	reg passed;

	// Instantiate the Unit Under Test (UUT)
	combination_lock_fsm uut (
		.Locked(Locked), 
		.state(state), 
		.Right(Right), 
		.Left(Left), 
		.Center(Center), 
		.Clk(Clk), 
		.South(South), 
		.Count(Count)
	);

	/*generate clock signal*/
	always
		#5 Clk <= ~Clk;


	initial begin
		// Initialize Inputs
		Right = 0;
		Left = 0;
		Center = 0;
		Clk = 0;
		South = 1;
		Count = 0;
		passed = 1;//innocent until proven otherwise!

		/*hold reset for a couple clocks*/
		#20 South = 0;
		#10;
		
		/*Ensure we remain in S0*/
		Left = 1;
		#10; 
		if(state != S0)
		  begin
			$display("Error with S0!");
			passed = 0; //signal failure!
			$stop;
		  end
        if(Locked != 1)
		  begin
			$display("Error with Locked signal in S0!");
			passed = 0; //signal failure!
			$stop;
		  end

		Left = 0;
      Center = 1;
		#10;
		if(state != S0)
		  begin
			$display("Error with S0!");
			passed = 0; //signal failure!
			$stop;
		  end
		Center = 0;
		/*attempt to transition to S1*/
		Right = 1;
		#10;
		if(state !=S1)
		  begin
			$display("Failed to transition to S1!");
			passed = 0; //signal failure!
			$stop;
		  end
        if(Locked != 1)
		  begin
			$display("Error with Locked signal in S1!");
			passed = 0; //signal failure!
			$stop;
		  end

		 Right = 0;
		 /*fake a bad input number*/
		 //count is already 0!
		 Left = 1;
		 #10;
		 if(state != S0)
		  begin
			$display("Error with S1!");
			passed = 0; //signal failure!
			$stop;
		  end
		Left = 0;
		/*transition back to S1*/
		Right = 1;
		#10;
		if(state !=S1)
		  begin
			$display("Failed to transition to S1!");
			passed = 0; //signal failure!
			$stop;
		  end
		/*test hold in S1*/
		#10;
		if(state !=S1)
		  begin
			$display("Failed to stay in S1!");
			passed = 0; //signal failure!
			$stop;
		  end
		Right = 0;
		/*attempt to transition to S2*/
		Count = 13;
		Left = 1;
		#10;
		if(state !=S2)
		  begin
			$display("Failed to transition to S2!");
			passed = 0; //signal failure!
			$stop;
		  end
        if(Locked != 1)
		  begin
			$display("Error with Locked signal in S2!");
			passed = 0; //signal failure!
			$stop;
		  end

		/*test hold in S2*/
		#10;
		if(state !=S2)
		  begin
			$display("Failed to stay in S2!");
			passed = 0; //signal failure!
			$stop;
		  end
		Left = 0;
		/*okay put in the rest of the combination*/
		Right = 1;
		Count = 7;
		#10;
		if(state !=S3)
		  begin
			$display("Failed to transition to S3!");
			passed = 0; //signal failure!
			$stop;
		  end	
        if(Locked != 1)
		  begin
			$display("Error with Locked signal in S3!");
			passed = 0; //signal failure!
			$stop;
		  end

		Right = 0;
		Center = 1;
		Count = 17;
		#10;
		if(state !=S4)
		  begin
			$display("Failed to transition to S4!");
			passed = 0; //signal failure!
			$stop;
		  end	
        if(Locked != 0)
		  begin
			$display("Error with Locked signal in S4!");
			passed = 0; //signal failure!
			$stop;
		  end

		/*test hold in S4*/
		#10;
		Center = 0;
		#10;
		Right = 1;
		#10;
		Right = 0;
		Left = 1;
		#10;
		Left = 0;
		#10;
		if(state !=S4)
		  begin
			$display("Failed to stay to S4!");
			passed = 0; //signal failure!
			$stop;
		  end
		/*test reset*/
		South = 1; 
		#10;
		if(state !=S0)
		  begin
			$display("Failed to reset!");
			passed = 0; //signal failure!
			$stop;
		  end
			
		#10;	
		if(passed)
			$display("All Tests Passed!!!");
	   $stop;
	end
      
endmodule

