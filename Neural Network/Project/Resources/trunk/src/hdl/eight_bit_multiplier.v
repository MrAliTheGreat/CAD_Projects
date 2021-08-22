`timescale 1ns / 1ps

module eight_bit_multiplier(input [7:0] a, input [7:0] b, output [15:0] out);

	wire [7:0] add_out0;
	wire [11:0] add_out1, add_out2;
	wire [7:0] multiplication_out0, multiplication_out1, multiplication_out2, multiplication_out3;
	
	
	assign add_out0 = multiplication_out1 + {4'b0, multiplication_out0[7:4]};
	assign add_out1 = {multiplication_out3, 4'b0} + {4'b0 + multiplication_out2};
	assign add_out2 = add_out1 + {4'b0, add_out0};
	
	assign out = {a[7] ^ b[7], add_out2[10:0], multiplication_out0[3:0]};
	
	four_bit_multiplier multiplication0 (.a(a[3:0]), .b(b[3:0]), .out(multiplication_out0));

	four_bit_multiplier multiplication1 (.a({1'b0, a[6:4]}), .b(b[3:0]), .out(multiplication_out1));
	 
	four_bit_multiplier multiplication2 (.a(a[3:0]), .b({1'b0, b[6:4]}), .out(multiplication_out2));
	 
	four_bit_multiplier multiplication3 (.a({1'b0, a[6:4]}), .b({1'b0, b[6:4]}), .out(multiplication_out3));
endmodule
