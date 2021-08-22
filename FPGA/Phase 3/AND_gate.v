`timescale 1ns/1ns

module AND_gate(output out , input in1 , in2);
  
  MUX_2to1 cut_mux(1'b0 , in1 , in2 , out);
  
endmodule
