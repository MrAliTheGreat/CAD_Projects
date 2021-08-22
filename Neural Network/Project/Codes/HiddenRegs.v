`timescale 1ns/1ns

module HiddenRegs(input clk, rst, ld1 , ld2 ,
                  input [7:0] in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , in16 , in17 , in18 ,
                  in19 , in20 , output [159:0] out_concat);
                  
  wire [7:0] out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , out11 , out12 , out13 , out14 , out15 , out16 , out17 , out18;
  wire [7:0] out19 , out20;
  
  Reg_8 cut_reg_1(clk, rst, ld1 , in1 , out1);
  Reg_8 cut_reg_2(clk, rst, ld1 , in2 , out2);
  Reg_8 cut_reg_3(clk, rst, ld1 , in3 , out3);
  Reg_8 cut_reg_4(clk, rst, ld1 , in4 , out4);
  Reg_8 cut_reg_5(clk, rst, ld1 , in5 , out5);
  Reg_8 cut_reg_6(clk, rst, ld1 , in6 , out6);
  Reg_8 cut_reg_7(clk, rst, ld1 , in7 , out7);
  Reg_8 cut_reg_8(clk, rst, ld1 , in8 , out8);
  Reg_8 cut_reg_9(clk, rst, ld1 , in9 , out9);
  Reg_8 cut_reg_10(clk, rst, ld1 , in10 , out10);
  Reg_8 cut_reg_11(clk, rst, ld2 , in11 , out11);
  Reg_8 cut_reg_12(clk, rst, ld2 , in12 , out12);
  Reg_8 cut_reg_13(clk, rst, ld2 , in13 , out13);
  Reg_8 cut_reg_14(clk, rst, ld2 , in14 , out14);
  Reg_8 cut_reg_15(clk, rst, ld2 , in15 , out15);
  Reg_8 cut_reg_16(clk, rst, ld2 , in16 , out16);
  Reg_8 cut_reg_17(clk, rst, ld2 , in17 , out17);
  Reg_8 cut_reg_18(clk, rst, ld2 , in18 , out18);
  Reg_8 cut_reg_19(clk, rst, ld2 , in19 , out19);
  Reg_8 cut_reg_20(clk, rst, ld2 , in20 , out20);

  assign out_concat = {out20 , out19 , out18 , out17 , out16 , out15 , out14 , out13 , out12 , out11 , out10 , out9 , out8 , 
                       out7 , out6 , out5 , out4 , out3 , out2 , out1};

endmodule


