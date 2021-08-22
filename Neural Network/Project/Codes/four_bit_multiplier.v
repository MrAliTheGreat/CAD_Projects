`timescale 1ns / 1ps

module four_bit_multiplier(input [3:0] a, input [3:0] b, output [7:0] out);

	wire [3:0] multiplication_out0, multiplication_out1, multiplication_out2, multiplication_out3;
	wire [3:0] add_out0;
	wire [5:0] add_out1, add_out2;
	
	assign add_out0 = multiplication_out1 + {2'b0, multiplication_out0[3:2]};
	assign add_out1 = {multiplication_out3, 2'b0} + {2'b0 + multiplication_out2};
	assign add_out2 = add_out1 + {2'b0, add_out0};
	
	assign out = {add_out2, multiplication_out0[1:0]};
	
	two_bit_multiplier multiplication0 (.a(a[1:0]), .b(b[1:0]), .out(multiplication_out0));

	two_bit_multiplier multiplication1 (.a(a[3:2]), .b(b[1:0]), .out(multiplication_out1));
	 
	two_bit_multiplier multiplication2 (.a(a[1:0]), .b(b[3:2]), .out(multiplication_out2));
	 
	two_bit_multiplier multiplication3 (.a(a[3:2]), .b(b[3:2]), .out(multiplication_out3));
endmodule
