`timescale 1ns/1ns

module Multiplier_2(input A1 , A0 , B1 , B0 , output P3 , P2 , P1 , P0);
  wire a , b , c , d , e , f , g , h , i , j , k , l;
  // P3
  AND_gate cut_and_1(a , A0 , B0);
  AND_gate cut_and_2(b , A1 , B1);
  AND_gate cut_and_3(P3 , a , b);
  
  // P2
  NAND_gate cut_nand_1(c , A0 , B0);
  AND_gate cut_and_4(P2 , b , c);
  
  // P1
  XOR_gate cut_xor_1(d, A0 , B0);
  AND_gate cut_and_5(e , b , d);
  
  AND_gate cut_and_6(f , A1 , B0);
  INV_gate cut_not_1(g , B1);
  AND_gate cut_and_7(h , f , g);
  OR_gate cut_or_1(i , e , h);
  
  AND_gate cut_and_8(j , A0 , B1);
  INV_gate cut_not_2(k , A1);
  AND_gate cut_and_9(l , j , k);
  
  OR_gate cut_or_2(P1 , i , l);
  
  // P0
  AND_gate cut_and_10(P0 , A0 , B0);
  
endmodule


