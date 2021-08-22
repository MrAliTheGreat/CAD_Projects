`timescale 1ns/1ns

module Register_8(input clk , rst , ld , 
                  input in7 , in6 , in5 , in4 , in3 , in2 , in1 , in0 ,
                  output out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  Register_1 cut_reg_1(clk , rst , ld , in7 , out7);
  Register_1 cut_reg_2(clk , rst , ld , in6 , out6);
  Register_1 cut_reg_3(clk , rst , ld , in5 , out5);
  Register_1 cut_reg_4(clk , rst , ld , in4 , out4);
  Register_1 cut_reg_5(clk , rst , ld , in3 , out3);
  Register_1 cut_reg_6(clk , rst , ld , in2 , out2);
  Register_1 cut_reg_7(clk , rst , ld , in1 , out1);
  Register_1 cut_reg_8(clk , rst , ld , in0 , out0);
  
endmodule

