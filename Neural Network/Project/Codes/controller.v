`timescale 1ns / 1ps

module controller(input clk, input start_signal, input [1:0] ctrl_data , output reg ready_signal, output reg [7:0] index);

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
				if (counter > ((ctrl_data == 2'b00) ? 62 : (ctrl_data == 2'b01) ? 62 : (ctrl_data == 2'b10) ? 20 : 1'bz) - 1'b1) begin
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
