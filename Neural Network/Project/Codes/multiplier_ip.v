`timescale 1ns / 1ps

module multiplier_ip(input [7:0] a, input [7:0] b, output [15:0] out);

	assign out[15] = a[7] ^ b[7];
  assign out[14:0] = a[6:0] * b[6:0];

endmodule
