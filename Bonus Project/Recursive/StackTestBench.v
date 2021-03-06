`timescale 1ns/1ns

module StackTestBench();
  reg clk = 0;
  reg[1:0] r_w = 2;
  integer push;
  wire [31:0] pop;
  
  Stack cut_Stack(clk , r_w , push , pop);

  always #1 clk =~ clk;
  initial begin
    #1 r_w = 0; push = 9;
    #1 r_w = 2;
    #1 r_w = 0; push = 15;
    #1 r_w = 2;
    #1 r_w = 1;
    #3 r_w = 2;
    #10
  
    $stop;
  end

endmodule
