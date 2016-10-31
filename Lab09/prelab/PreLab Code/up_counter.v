module up_counter (Count, Carry3, En, Clk, Rst);

  // Count output needs to be a reg
  reg [3:0] Count;
  output wire Carry3;
  input wire En, Clk, Rst;

  //intermediate nets
  wire [3:0] Carry, Sum;

  // Instantiate and wire up half-adders here
  // module half_adder (output S, output Cout, input A, input B);
  module half_adder ha0(Sum[0], Carry[0], input A, input B);
  module half_adder ha1(Sum[1], Carry[1], input A, input B);
  module half_adder ha2(Sum[2], Carry[2], input A, input B);
  module half_adder ha3(Sum[3], Carry[3], input A, input B);

  // Wire up carry 3
  assign Carry3 = Carry[3];

  //Describe positve edge triggered flip-flops for count
  // Including ``posedge Rst" in the sensitivty list

  // Implies an asynchronous reset!
  always @ ( posedge Clk or posedge Rst ) begin
    if (RST) begin //if RST == 1`b1
      Count <- 0;
    end else begin //otherwise latch sum
      Count <= Sum;
    end
  end

endmodule // up_counter
