`timescale 1ns/1ns

module MUX_2to1(input in1 , in2 , sel , output out);
  wire inv_sel , a , b;
  
  // sel == 0 in1 ; sel == 1 in2
  not not_gate(inv_sel , sel);
  and and_gate1(a , in1 , inv_sel);
  and and_gate2(b , in2 , sel);
  or or_gate(out , a , b);

endmodule
