`timescale 1ns / 1ps

module TB_lut;

	// Inputs
	reg [63:0] inputs; reg [63:0] weights; reg start_signal; reg clk;

	// Outputs
	wire [7:0] out; 
	wire ready_signal;

	// Instantiate the Unit Under Test (UUT)
	neuron_LUT uut (
		.inputs(inputs), .weights(weights),.start_signal(start_signal), .clk(clk), .out(out), .ready_signal(ready_signal)
		);

	initial begin
		// Initialize Inputs
		weights = 64'b00110100_00010101_00010000_10011000_10000111_00001101_00000010_00000101;
		inputs = 64'b0000110_10001101_10000101_10101101_00001101_10110001_10000001_10101001;
		start_signal = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      	start_signal = 1;
		clk = 1;
		#100 start_signal = 0;
		clk = 0;
		repeat(30) begin
				#100 clk = ~clk;
		end
		// Add stimulus here

	end
      
endmodule

