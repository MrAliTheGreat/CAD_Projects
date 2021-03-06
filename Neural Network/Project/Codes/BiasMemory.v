`timescale 1ns/1ns

module BiasMemory_Hidden #(parameter H_NODE_NUMBER = 20)
                          (output [H_NODE_NUMBER*8-1:0] data);
  // Node Number Starts from 0
  reg [7:0] H_Bias_mem [0:19];
  reg [H_NODE_NUMBER*8-1:0] dataConcat;
  
  initial $readmemh("bh_sm.dat", H_Bias_mem);
  
  integer i;
  always@(*) begin
    for (i = 0 ; i < H_NODE_NUMBER ; i = i+1)
        dataConcat[i * 8 +:8] = H_Bias_mem[i];
  end  
  
  assign data = dataConcat; 
   
endmodule


module BiasMemory_Output #(parameter O_NODE_NUMBER = 10)
                          (output [O_NODE_NUMBER*8-1:0] data);
  reg [7:0] O_Bias_mem [0:9];
  reg [O_NODE_NUMBER*8-1:0] dataConcat;
  
  initial $readmemh("bo_sm.dat", O_Bias_mem);
  
  integer i;
  always@(*) begin
    for (i = 0 ; i < O_NODE_NUMBER ; i = i+1)
        dataConcat[i * 8 +:8] = O_Bias_mem[i];
  end
  
  assign data = dataConcat; 
   
endmodule


