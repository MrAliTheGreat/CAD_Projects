`timescale 1ns/1ns

module TestBenchRecursive();
  reg clk = 0;
  reg[3:0] n;

  wire [10:0] out;
  
  always #20 clk =~ clk;
  initial begin
    n = 9;
    #1000
    $stop;
  end
  
  Recursive cut_Recursive(clk , n , out);

endmodule

