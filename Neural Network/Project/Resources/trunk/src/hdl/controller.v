`timescale 1ns / 1ps

module controller# (parameter INPUT_COUNT=8)
	(
		input clk, input start_signal, output reg ready_signal, output reg [7:0] index
    );

	reg ps, ns;
	reg [7:0] counter;
	
	always@(ps or counter) begin
		ready_signal = 1'b0;
		index = 7'b0;
		case(ps)
			1'b0: begin
				ready_signal = 1'b1;
			end
			1'b1: index = counter - 1'b1;
				
		endcase
	end
	
	always@(ps or counter) begin
		ns = 1'b0;
		case(ps)
			1'b1: begin
				if (counter > INPUT_COUNT - 1'b1) begin
					ns = 1'b0;
				end
				else begin
					ns = 1'b1;
				end
			end
		endcase
	end
	
	always@(posedge clk) begin
		if (start_signal) begin
			ps <= 1'b1;
			counter = 8'b0;
		end
		else begin
			ps <= ns;
			counter = counter + 1'b1;
		end
	end

endmodule
