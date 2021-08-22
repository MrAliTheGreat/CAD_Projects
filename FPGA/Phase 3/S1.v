`timescale 1ns/1ns

module S1(input D00 , D01 , D10 , D11 , A1 , B1 , A0 , clr , clk , output reg out);
  wire in;
  
  assign in = ({(A1 | B1) , (A0 & clr)} == 2'b00) ? D00 :
              ({(A1 | B1) , (A0 & clr)} == 2'b01) ? D01 :
              ({(A1 | B1) , (A0 & clr)} == 2'b10) ? D10 : D11;

  always @ (posedge clk , posedge clr) begin
    if(clr)
      out <= 1'b0;
    else
      out <= in;
  end

endmodule

