`timescale 1ns/1ns

module Register_1(input clk , rst , load , in , output reg out);
  always @ (posedge clk , posedge rst) begin
    if(rst) out <= 1'b0;
    else
      if(load) out <= in;
  end
endmodule
