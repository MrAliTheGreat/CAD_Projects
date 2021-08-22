`timescale 1ns / 1ps

module activation_function# (parameter WIDTH=32) (input signed [WIDTH-1:0] a_input , input [7:0] bias, input [1:0] ctrl_data , input ready_signal, output reg [7:0] out);

/*	 
	wire [15:0] bias_res[bias
	
	multiplier_ip cut_mul(bias, 8'b01111111 , bias_res);
	
	wire signed [WIDTH-1:0] a_in = (ctrl_data == 2'b00 || ctrl_data == 2'b01) ? ((a_input + {bias_res[15], {WIDTH-16{1'b0}}, bias_res[14:0]}) >> 9) : (a_input + {bias_res[15], {WIDTH-16{1'b0}}, bias_res[14:0]});
*/

	always@(*) begin
		if (ready_signal) begin
			if (a_input[WIDTH-1] == 1 || a_input == 0)
				out = 8'b0;
			else begin
				if (a_input[WIDTH-2:0] > 127)
					out = {a_input[WIDTH-1], {7{1'b1}}};
				else
					out = {a_input[WIDTH-1], a_input[6:0]};
			end
		end
		else
			out = 8'b0;
	end

endmodule

