`timescale 1ns/1ns

module XOR_gate(output out , input in1 , in2);
  wire not_in2;
  
  INV_gate cut_inv(not_in2 , in2);
  MUX_2to1 cut_mux(in2 , not_in2 , in1 , out);
  
endmodule

