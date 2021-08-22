`timescale 1ns / 1ps

module adder# (parameter WIDTH=32) (input [WIDTH-1:0] a_in, input [15:0] b_in, output reg [WIDTH-1:0] out);

	reg [WIDTH-1:0] temp_b_in;
	always@(*) begin
		temp_b_in = {b_in[15], {WIDTH-16{1'b0}}, b_in[14:0]};
		case({a_in[WIDTH-1], temp_b_in[WIDTH-1]})
			2'b00: out = a_in + temp_b_in;
			2'b11: out = {1'b1, a_in[WIDTH-2:0] + temp_b_in[WIDTH-2:0]};
			2'b10: out = a_in[WIDTH-2:0] > temp_b_in[WIDTH-2:0] ? {1'b1, a_in[WIDTH-2:0] - temp_b_in[WIDTH-2:0]} : {1'b0, temp_b_in[WIDTH-2:0] - a_in[WIDTH-2:0]};
			2'b01: out = temp_b_in[WIDTH-2:0] > a_in[WIDTH-2:0] ? {1'b1, temp_b_in[WIDTH-2:0] - a_in[WIDTH-2:0]} : {1'b0, a_in[WIDTH-2:0] - temp_b_in[WIDTH-2:0]};
			default: out = 16'b0;
		endcase
	end
	
endmodule
