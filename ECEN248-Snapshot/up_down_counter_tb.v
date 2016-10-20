`timescale 1ns / 1ps

module up_down_counter_tb;

	// Inputs
	reg Up;
	reg Down;
	reg South;
	reg Clk;

	// Outputs
	wire [4:0] Count;

	// Instantiate the Unit Under Test (UUT)
	up_down_counter uut (
		.Count(Count), 
		.Up(Up), 
		.Down(Down),
      .South(South),
		.Clk(Clk)
	);

	/*generate clock signal*/
	always
		#5 Clk <= ~Clk;

	initial begin
		// Initialize Inputs
		Up = 0;
		Down = 0;
		Clk = 0;
		South = 1; //put into reset

		/*hold reset for a couple clocks cycles*/
		#20;
		if(Count != 0)
		  begin
			$display("Reset is not working!");
			$stop;
		  end
		South = 0; //release reset
		/*wait to test hold */
		#40;
		if(Count != 0)
		  begin
			$display("Not holding count!");
			$stop;
		  end
		/*let counter run forwared*/
		Up = 1;
		#10;
		if(Count != 1)
		  begin
			   $display("Counter is not count up!");
				$stop;
		  end
		#250;
		/*should roll over in this time period!*/
		if(Count != 6)
		  begin
				$display("Counter is not rolling over properly!");
				$stop;
			end
		Up = 0;
		Down = 1;
		#250
		if(Count != 1)
		  begin
				$display("Counter is not rolling over properly!");
				$stop;
			end
		$display("All tests passed!!!");
		// Add stimulus here

	end
      
endmodule

