`timescale 1ns/1ns

module TestBench();
  reg clk = 0;
  reg start = 0;
  reg[3:0] n;
  
  wire ready;
  wire [10:0] out;
  
  IterativeFib cut_Iterative(start , clk , n , ready , out);

  always #20 clk =~ clk;
  initial begin
    #20 start = 1; n = 9;
    #20 start = 0;
    #1000
    $stop;
  end

endmodule

/*
Fibonacci Numbers:
0 : 0
1 : 1
2 : 1
3 : 2
4 : 3
5 : 5
6 : 8
7 : 13
8 : 21
9 : 34
10 : 55
11 : 89
12 : 144
13 : 233
14 : 377
15 : 610
*/
