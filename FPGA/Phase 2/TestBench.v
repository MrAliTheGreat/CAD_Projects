`timescale 1ns/1ns
module TestBench();
  reg clk = 1 , rst = 0 , start = 0;
  reg A3 , A2 , A1 , A0;
  reg B3 , B2 , B1 , B0;
  
  
  wire out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0;
  
  Circuit cut_circuit(clk , rst , start ,
                      A3 , A2 , A1 , A0 , B3 , B2 , B1 , B0 ,
                      out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  always #20 clk =~ clk;
  initial begin
    // Input 1
    rst = 1;
    #40 rst = 0; start = 1;
    A3 = 0 ; A2 = 1 ; A1 = 1 ; A0 = 1; // 4'b0111 -> 7
    B3 = 0 ; B2 = 0 ; B1 = 1 ; B0 = 0; // 4'b1101 -> 13
    // 7*13 = 91 -> 8'b00001110
    #40 start = 0;
    #1000
    
    $stop;
end
endmodule
