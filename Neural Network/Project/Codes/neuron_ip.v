`timescale 1ns / 1ps

module neuron_ip# (parameter WIDTH=32, parameter INPUT_COUNT=62) // 62 -> input layer
    (
    input [INPUT_COUNT*8-1:0] inputs, weights , input [7:0] bias, input [1:0] ctrl_data ,
    input start_signal, input clk, output [7:0] out, output ready_signal
    );
	 
	 wire [WIDTH-1:0] add_out, accum_out;
   wire [7:0] index, multiplication_in1, multiplication_in2;
	 wire [15:0] multiplication_out;
	 wire reg_enable;
	 
	 assign reg_enable = ~ready_signal;

	controller controller_module (
    .clk(clk), .start_signal(start_signal) , .ctrl_data(ctrl_data) , .ready_signal(ready_signal), .index(index)
        );
	 
	adder addder_module (
        .a_in(accum_out), .b_in(multiplication_out), .out(add_out)
        );
	 
	input_select_module inputselect_module (
        .inputs(inputs), .weights(weights),.indices(index), .value_out(multiplication_in1), .weight_out(multiplication_in2)
        );
	 
	eight_bit_multiplier eight_bit_multiplier_module (
        .a(multiplication_in1), .b(multiplication_in2), .out(multiplication_out)
        );
	 
	accumulator_reg accumulator_reg_module (
    .a_in(add_out), .clk(clk),.en(reg_enable),.out(accum_out)
        );
	 
	activation_function activation_function_module (
    .a_input(accum_out), .bias(bias) , .ctrl_data(ctrl_data) , .ready_signal(ready_signal), .out(out)
        );

endmodule
