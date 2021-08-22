`timescale 1ns / 1ps

module accumulator_reg# (parameter WIDTH=32) (input signed [WIDTH-1:0] a_in, input clk, input en, output reg signed [WIDTH-1:0] out);

	always @(posedge clk) begin
		if(en)
			out <= a_in;
		else
		  out <= 32'b0;
   end
	
	
endmodule
