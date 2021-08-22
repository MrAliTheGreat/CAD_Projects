`timescale 1ns/1ns
module TestBench();
  reg clk = 1 , rst = 0 , start = 0;
  reg A3 , A2 , A1 , A0;
  reg B3 , B2 , B1 , B0;
  integer numberA = 0 , numberB = 0;
  
  wire out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0;
  
  Circuit cut_circuit(clk , rst , start ,
                      A3 , A2 , A1 , A0 , B3 , B2 , B1 , B0 ,
                      out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  always #20 clk =~ clk;
  initial begin
    repeat(16) begin
      repeat(16) begin
        rst = 1;
        #40 rst = 0; start = 1;
        {A3 , A2 , A1 , A0} = numberA;
        {B3 , B2 , B1 , B0} = numberB;
        #40 start = 0;
        #1000 numberA = numberA + 1;        
      end
      numberA = 0;
      numberB = numberB + 1;
    end
    $stop;
  end
endmodule

