`timescale 1ns / 1ps

module multiplier_ip(input [7:0] a, input [7:0] b, output [15:0] out);

	assign out[15] = a[7] ^ b[7];
	assign out[14] = 1'b0;
	
	mul7_ip mul_ip (.a(a[6:0]), .b(b[6:0]), .p(out[13:0]));

endmodule
