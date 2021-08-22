`timescale 1ns/1ns

module Shift(input A3 , A2 , A1 , A0 , shctrl_1 , shctrl_0 ,
             output out7 ,  out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  wire ctrl_or , out_mux_1 , out_mux_2 , out_mux_3 , out_mux_4;
  
  or cut_or_1(ctrl_or , shctrl_1 , shctrl_0);
  
  MUX_2to1 cut_MUX_7(1'b0 , A3 , shctrl_1 , out7);
  
  MUX_2to1 cut_MUX_6(1'b0 , A2 , shctrl_1 , out6);
  
  MUX_2to1 cut_MUX_5a(A3 , A1 , shctrl_1 , out_mux_1);
  MUX_2to1 cut_MUX_5b(1'b0 , out_mux_1 , ctrl_or , out5);
  
  MUX_2to1 cut_MUX_4a(A2 , A0 , shctrl_1 , out_mux_2);  
  MUX_2to1 cut_MUX_4b(1'b0 , out_mux_2 , ctrl_or , out4);
  
  MUX_2to1 cut_MUX_3a(A3 , A1 , shctrl_0 , out_mux_3);  
  MUX_2to1 cut_MUX_3b(out_mux_3 , 1'b0 , shctrl_1 , out3);
  
  MUX_2to1 cut_MUX_2a(A2 , A0 , shctrl_0 , out_mux_4);  
  MUX_2to1 cut_MUX_2b(out_mux_4 , 1'b0 , shctrl_1 , out2);
  
  MUX_2to1 cut_MUX_1(A1 , 1'b0 , ctrl_or , out1);
  
  MUX_2to1 cut_MUX_0(A0 , 1'b0 , ctrl_or , out0);  
  
endmodule
