`timescale 1ns/1ns

module FullAdder(input in1 , in2 , cin , output sum , cout);
  wire a , b , c;
  
  xor cut_xor_1(a , in1 , in2);
  xor cut_xor_2(sum , a , cin);
  
  and cut_and_1(b , a , cin);
  and cut_and_2(c , in1 , in2);
  or cut_or_1(cout , b , c);
  
endmodule


