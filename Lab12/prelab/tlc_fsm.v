module tlc_fsm (
	output reg [2:0] state, // output for debugging
	output reg RstCount, // use an always block
	// another always block for these as well
	output reg [1:0] highwaySignal, farmSignal,
	input wire [31-1:0] Count,
	input wire Clk, Rst // clokc and reset
	);

	parameter S0 = 3'b000,
		   S1 = 3'b001,
		   S2 = 3'b010,
		   S3 = 3'b011,
		   S4 = 3'b100,
		   S5 = 3'b101,
		   GREEN = 2'b00,
		   YELLOW = 2'b01,
		   RED = 2'b10;

	reg [2:0] nextState;

	// Output logic
	always @ (state or RstCount) begin
		case (state)
			S0: begin
			if (RstCount) begin
				highwaySignal = GREEN;
				farmSignal = RED;
			end else begin
				highwaySignal = RED;
				farmSignal = RED;
			end
			end
			S1: begin
			if (RstCount) begin
				highwaySignal = YELLOW;
				farmSignal = RED;
			end else begin
				highwaySignal = GREEN;
				farmSignal = RED;
			end
			end
			S2: begin
			if (RstCount) begin
				highwaySignal = RED;
				farmSignal = RED;
			end else begin
				highwaySignal = YELLOW;
				farmSignal = RED;
			end
			end
			S3: begin
			if (RstCount) begin
				highwaySignal = RED;
				farmSignal = GREEN;
			end else begin
				highwaySignal = RED;
				farmSignal = RED;
			end
			end
			S4: begin
			if (RstCount) begin
				highwaySignal = RED;
				farmSignal = YELLOW;
			end else begin
				highwaySignal = RED;
				farmSignal = GREEN;
			end
			end
			S5: begin
			if (RstCount) begin
				highwaySignal = RED;
				farmSignal = RED;
			end else begin
				highwaySignal = GREEN;
				farmSignal = YELLOW;
			end
			end

			default: ;
		endcase
	end




	// Next state logic
	always @ ( * ) begin
		case (state)
			S0: begin
				if (Count == 50000000) begin
					nextState = S1;
				end else begin
					nextState = S0;
				end
				end
			S1: begin
				if (Count == 1500000000) begin
					nextState = S2;
				end else begin
					nextState = S1;
				end
				end
			S2: begin
				if (Count == 150000000) begin
					nextState = S3;
				end else begin
					nextState = S2;
				end
				end
			S3: begin
				if (Count == 50000000) begin
					nextState = S4;
				end else begin
					nextState = S3;
				end
				end
			S4: begin
				if (Count == 750000000) begin
					nextState = S5;
				end else begin
					nextState = S4;
				end
				end
			S5: begin
				if (Count == 150000000) begin
					nextState = S1;
				end else begin
					nextState = S5;
				end
				end
			default: ;
		endcase
	end

	always @ (posedge Clk) begin
		if (Rst) begin
			stat <= S0;
		end else begin
			state <= nextState;
		end
	end

	assign Count = 0;

endmodule // tlc_fsm
