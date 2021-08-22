`timescale 1ns/1ns

module Reg_8(input clk, rst, ld, input [7:0] in, output reg [7:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 8'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule

