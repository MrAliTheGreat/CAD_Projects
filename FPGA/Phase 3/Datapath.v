`timescale 1ns/1ns

module Datapath(input clk , rst_out , ld_A , ld_B , l_1 , l_2 , shctrl_1 , shctrl_0 , ld_out ,
                input A3 , A2 , A1 , A0 , B3 , B2 , B1 , B0 ,
                output out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  wire outA3 , outA2 , outA1 , outA0 , outB3 , outB2 , outB1 , outB0 , clk_out , clk_regA ;
  wire outMUXA_1 , outMUXA_0 , outMUXB_1 , outMUXB_0;
  wire out_mul_3 , out_mul_2 , out_mul_1 , out_mul_0;
  wire out_sh7 ,  out_sh6 , out_sh5 , out_sh4 , out_sh3 , out_sh2 , out_sh1 , out_sh0;
  wire out_add7 , out_add6 , out_add5 , out_add4 , out_add3 , out_add2 , out_add1 , out_add0 , cout_add;
  
  Register_4 cut_reg_A(clk , 1'b0 , ld_A , A3 , A2 , A1 , A0 , outA3 , outA2 , outA1 , outA0);
  Register_4 cut_reg_B(clk , 1'b0 , ld_B , B3 , B2 , B1 , B0 , outB3 , outB2 , outB1 , outB0);
  
  MUX_2to1 cut_MUX_A1(outA3 , outA1 , l_1 , outMUXA_1);
  MUX_2to1 cut_MUX_A2(outA2 , outA0 , l_1 , outMUXA_0);
  
  MUX_2to1 cut_MUX_B1(outB3 , outB1 , l_2 , outMUXB_1);
  MUX_2to1 cut_MUX_B2(outB2 , outB0 , l_2 , outMUXB_0);
  
  Multiplier_2 cut_mul(outMUXA_1 , outMUXA_0 , outMUXB_1 , outMUXB_0 , out_mul_3 , out_mul_2 , out_mul_1 , out_mul_0);
  
  Shift cut_shift_logic(out_mul_3 , out_mul_2 , out_mul_1 , out_mul_0 , shctrl_1 , shctrl_0 ,
                        out_sh7 ,  out_sh6 , out_sh5 , out_sh4 , out_sh3 , out_sh2 , out_sh1 , out_sh0);
                        
  Adder_8 cut_adder(out_sh7 ,  out_sh6 , out_sh5 , out_sh4 , out_sh3 , out_sh2 , out_sh1 , out_sh0 ,
                    out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0 ,
                    out_add7 , out_add6 , out_add5 , out_add4 , out_add3 , out_add2 , out_add1 , out_add0 , cout_add);
              
  Register_8 cut_reg_out(clk , rst_out , ld_out , 
                         out_add7 , out_add6 , out_add5 , out_add4 , out_add3 , out_add2 , out_add1 , out_add0 ,
                         out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);  
  
  
endmodule


