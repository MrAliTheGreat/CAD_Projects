`timescale 1ns/1ns

module Register_1(input clk , clr , ld , in , output out);
  
  S2 cut_S(1'bz , 1'bz , 1'bz , in , 1'b1 , 1'b1 , 1'b1 , 1'b1 , clr , ld , clk , out);
  
endmodule
