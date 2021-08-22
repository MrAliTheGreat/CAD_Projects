`timescale 1ns / 1ps

module input_select_module# (parameter INPUT_COUNT=8) (input [INPUT_COUNT*8-1:0] inputs, input [INPUT_COUNT*8-1:0] weights,input [7:0] indices, output [7:0] value_out,output [7:0] weight_out);

	assign weight_out = weights[(indices+1)*8-1 -: 8];
	assign value_out = inputs[(indices+1)*8-1 -: 8];

endmodule
