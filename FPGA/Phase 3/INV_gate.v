`timescale 1ns/1ns

module INV_gate(output out , input in1);
  
  MUX_2to1 cut_mux(1'b1 , 1'b0 , in1 , out);
  
endmodule


