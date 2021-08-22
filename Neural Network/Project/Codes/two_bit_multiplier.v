`timescale 1ns / 1ps

module two_bit_multiplier(input [1:0] a, input [1:0] b, output [3:0] out);

	wire n_a0, n_a1, n_b0, n_b1;
    wire [3:0] temp_wire1;
    wire [1:0] temp_wire2;

    not(n_a0, a[0]);
    not(n_a1, a[1]);
    not(n_b0, b[0]);
    not(n_b1, b[1]);

    and(out[0], a[0], b[0]);

    and(temp_wire1[0], a[0], n_b0, b[1]);
    and(temp_wire1[1], a[0], n_a1, b[1]);
    and(temp_wire1[2], a[1], b[0], n_b1);
    and(temp_wire1[3], n_a0, a[1], b[0]);
    
    or(out[1], temp_wire1[0], temp_wire1[1], temp_wire1[2], temp_wire1[3]);

    and(temp_wire2[0], n_a0, a[1], b[1]);
    and(temp_wire2[1], a[1], n_b0, b[1]);
    
    or(out[2], temp_wire2[0], temp_wire2[1]);

    and(out[3], a[0], a[1], b[0], b[1]);

endmodule
