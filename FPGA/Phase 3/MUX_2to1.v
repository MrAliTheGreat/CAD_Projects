`timescale 1ns/1ns

module MUX_2to1(input in1 , in2 , sel , output out);
  // sel == 0 in1 ; sel == 1 in2
  
  C1 cut_C1(in1 , 1'bz , in2 , 1'bz , 1'b1 , 1'b1 , sel , 1'b0 , out);
  
endmodule
