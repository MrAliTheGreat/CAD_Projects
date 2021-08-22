`timescale 1ns/1ns

module NAND_gate(output out , input in1 , in2);
  wire out_and;
  
  AND_gate cut_and(out_and , in1 , in2);
  INV_gate cut_inv(out , out_and);
  
endmodule
