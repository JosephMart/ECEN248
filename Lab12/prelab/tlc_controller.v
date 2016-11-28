module tlc_controller (
	// LCD interface wires make up our outputs
	output wire LCD_E, LCD_RW, LCD_RS,
	output wire [3:0] SF_D,
	output wire [3:0] J1,
	input wire Clk,
	input wire South
	);

	// intermediate nets
	wire SouthSync;
	wire [1:0] highwaySignal, farmSignal;
	wire RstCount;
	reg [30:0] Count;

	assign J1[3] = RstCount;

	// synchronize button inputs
	synchronizer syncSouth(SouthSync, South, Clk);

	// instantiate FSM
	tlc_fsm FSM(.state(J1[2:0]), //wire state up to J1



				.Rst(SouthSync)
	);

	// wire up LCD driver
	lcd_driver_lab11_ver1 LCD_driver(
		.Clk(Clk),
		.Rst(SouthSync),
		.highwaySignal(highwaySignal),
		.SF_D(SF_D),
		.LCD_E(LCD_E),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW)
		);

	// describe counter with asynchonous reset

endmodule // tlc_controller
