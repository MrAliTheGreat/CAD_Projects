`timescale 1ns/1ns

module C1(input A1 , A0 , B1 , B0 , SA , SB , S1 , S0 , output F);
  wire F1 , F2;
  assign F1 = SA ? A1 : A0;
  assign F2 = SB ? B1 : B0;
  assign F = (S0 | S1) ? F2 : F1;
  
endmodule
