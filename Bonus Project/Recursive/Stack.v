`timescale 1ns/1ns

module Stack(input clk , input[1:0] R_W , input[31:0] PUSH , output reg[31:0] POP);
  
  reg [31:0] temp[0:99];
  integer tos = 3;

  always @ (posedge clk) begin
    if(R_W == 2) begin // Nothing
      // Do nothing
    end
    else if(R_W == 1 && tos != 3) begin // pop
      tos = tos + 1;
      POP = temp[tos];
    end
    else if(R_W == 0 && tos != 0) begin // push
      temp[tos] = PUSH; 
      tos = tos - 1;
    end
  end
  
endmodule