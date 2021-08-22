`timescale 1ns/1ns

module WeightsMemory_Hidden #(parameter INPUT_COUNT=62 , parameter H_NODE_NUMBER = 20)
                             (output [INPUT_COUNT*H_NODE_NUMBER*8-1:0] data);
  // Node & input Number Starts from 1
  reg [7:0] H_weights_mem [0:1239];
  reg [INPUT_COUNT*H_NODE_NUMBER*8-1:0] dataConcat;
  
  initial $readmemh("w1_sm.dat", H_weights_mem);
  
  integer i;
  always@(*) begin
    for (i = 0 ; i < INPUT_COUNT * H_NODE_NUMBER ; i = i+1)
        dataConcat[i * 8 +:8] = H_weights_mem[i];
  end
  
  assign data = dataConcat;
   
endmodule


module WeightsMemory_Output #(parameter H_NODE_NUMBER = 20 , parameter O_NODE_NUMBER = 10)
                             (output [H_NODE_NUMBER*O_NODE_NUMBER*8-1:0] data);
  reg [7:0] O_weights_mem [0:199];
  reg [H_NODE_NUMBER*O_NODE_NUMBER*8-1:0] dataConcat;
  
  initial $readmemh("w2_sm.dat", O_weights_mem);
  
  integer i;
  always@(*) begin
    for (i = 0 ; i < H_NODE_NUMBER * O_NODE_NUMBER ; i = i+1)
        dataConcat[i * 8 +:8] = O_weights_mem[i];
  end 
  
  assign data = dataConcat;
   
endmodule





