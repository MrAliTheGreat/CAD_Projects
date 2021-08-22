`timescale 1ns / 1ps

module activation_function# (parameter WIDTH=32) (input signed [WIDTH-1:0] a_in, input ready_signal, output reg [7:0] out);
	
	always@(*) begin
		if (ready_signal) begin
			if (a_in[WIDTH-1] == 1 || a_in == 0)
				out = 8'b0;
			else begin
				if (a_in[WIDTH-2:8] > 0)
					out = {a_in[WIDTH-1], {7{1'b1}}};
				else
					out = {a_in[WIDTH-1], a_in[6:0]};
			end
		end
		else
			out = 8'b0;
	end

endmodule
