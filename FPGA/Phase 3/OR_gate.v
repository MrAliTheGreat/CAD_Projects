`timescale 1ns/1ns

module OR_gate(output out , input in1 , in2);
  
  MUX_2to1 cut_mux(in1 , 1'b1 , in2 , out);
  
endmodule
