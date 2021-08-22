`timescale 1ns/1ns

module Adder_8(input A7 , A6 , A5 , A4 , A3 , A2 , A1 , A0 ,
               input B7 , B6 , B5 , B4 , B3 , B2 , B1 , B0 ,
               output out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0 , cout);
  
  wire cout1 , cout2 , cout3 , cout4 , cout5 , cout6 , cout7;
  
  FullAdder cut_FA_1(A0 , B0 , 1'b0 , out0 , cout1);
  FullAdder cut_FA_2(A1 , B1 , cout1 , out1 , cout2);
  FullAdder cut_FA_3(A2 , B2 , cout2 , out2 , cout3);
  FullAdder cut_FA_4(A3 , B3 , cout3 , out3 , cout4);
  FullAdder cut_FA_5(A4 , B4 , cout4 , out4 , cout5);
  FullAdder cut_FA_6(A5 , B5 , cout5 , out5 , cout6);
  FullAdder cut_FA_7(A6 , B6 , cout6 , out6 , cout7);
  FullAdder cut_FA_8(A7 , B7 , cout7 , out7 , cout);
  
endmodule
