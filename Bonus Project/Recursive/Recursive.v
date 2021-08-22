`timescale 1ns/1ns

module Recursive(input clk , input [3:0] n , output[10:0] out);
  reg [3:0] n1;
  wire [31:0] pop , push;
  wire [1:0] r_w;
  
  Stack cut_stack(clk , r_w , push , pop);
  
  initial n1 = 9;
  
  function automatic [7:0] fibonacci(input [3:0] n); 
    begin
      if (n == 1 || n == 0)
        fibonacci = 1; 
      else
        fibonacci = fibonacci(n - 1) + fibonacci(n - 2);
    end
  endfunction
  
  assign out = fibonacci(n1);
  
endmodule
