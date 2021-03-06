`timescale 1ns/1ns

module Controller(input clk , rst , start , output rst_out , ld_A , ld_B , l_1 , l_2 , shctrl_1 , shctrl_0 , ld_out);
  wire ps2 , ps1 , ps0 , ns2 , ns1 , ns0;
  wire and_1 , and_2 , and_3 , and_4 , and_5 , and_6 , and_7 , and_8 , and_9 , and_10 , and_11 , and_12 , and_13;
  wire or_1 , or_2;
  wire not_ps2 , not_ps1 , not_ps0;
  
  // ns2
  INV_gate cut_not_3(not_ps2 , ps2); // ~ps2
  INV_gate cut_not_1(not_ps1 , ps1); // ~ps1
  INV_gate cut_not_2(not_ps0 , ps0); // ~ps0
  AND_gate cut_and_1(and_1 , not_ps1 , not_ps0); // ~ps1 & ~ps0
  AND_gate cut_and_2(and_2 , and_1 , ps2); // ~ps1 & ~ps0 & ps2
  AND_gate cut_and_3(and_3 , ps1 , ps0); // ps1 & ps0
  AND_gate cut_and_4(and_4 , and_3 , not_ps2); // ps1 & ps0 & ~ps2
  OR_gate cut_or_1(or_1 , and_4 , and_2); // ps1 & ps0 & ~ps2 | ~ps1 & ~ps0 & ps2
  assign ns2 = or_1; 
  
  // ns1
  AND_gate cut_and_5(and_5 , not_ps2 , not_ps1); // ~ps2 & ~ps1
  AND_gate cut_and_6(and_6 , and_5 , ps0); // ~ps2 & ~ps1 & ps0
  AND_gate cut_and_7(and_7 , not_ps2 , not_ps0); // ~ps2 & ~ps0
  AND_gate cut_and_8(and_8 , and_7 , ps1); // ~ps2 & ~ps0 & ps1
  OR_gate cut_or_2(ns1 , and_6 , and_8); // ~ps2 & ~ps0 & ps1 | ~ps2 & ~ps1 & ps0
  
  // ns0
  AND_gate cut_and_9(and_9 , and_5 , not_ps0); // ~ps2 & ~ps1 & ~ps0
  AND_gate cut_and_10(and_10 , and_9 , start); // ~ps2 & ~ps1 & ~ps0 & start
  OR_gate cut_or_3(or_2 , and_8 , and_2);
  OR_gate cut_or_4(ns0 , or_2 , and_10);
  
  // ld_A
  assign ld_A = and_6;
  
  // ld_B
  assign ld_B = and_6;
  
  // rst_out
  assign rst_out = and_6;
  
  // l_1
  AND_gate cut_and_11(and_11 , not_ps2 , ps1); // ~ps2 & ps1
  assign l_1 = and_11;
  
  // l_2
  assign l_2 = or_2;
  
  // shctrl_1
  AND_gate cut_and_12(and_12 , ps2 , ps0); // ps2 & ps0
  AND_gate cut_and_13(shctrl_1 , and_12 , not_ps1); // ps2 & ps0 & ~ps1
  
  // shctrl_0
  assign shctrl_0 = or_1;
  
  // ld_out
  AND_gate cut_and_14(and_13 , ps2 , not_ps1); // ps2 & ~ps1
  OR_gate cut_or_5(ld_out , and_13 , and_11);
  
  Register_3 cut_state(clk , rst , 1'b1 , ns2 , ns1 , ns0 , ps2 , ps1 , ps0);
  
endmodule
