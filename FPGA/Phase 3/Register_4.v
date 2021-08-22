`timescale 1ns/1ns

module Register_4(input clk , rst , ld ,
                  input in3 , in2 , in1 , in0 ,
                  output out3 , out2 , out1 , out0);
  
  Register_1 cut_reg_1(clk , rst , ld , in3 , out3);
  Register_1 cut_reg_2(clk , rst , ld , in2 , out2);
  Register_1 cut_reg_3(clk , rst , ld , in1 , out1);
  Register_1 cut_reg_4(clk , rst , ld , in0 , out0);
  
endmodule
