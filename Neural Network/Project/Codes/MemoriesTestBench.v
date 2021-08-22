`timescale 1ns/1ns

module MemoriesTestBench();
  reg [31:0] dataNumber , nodeNumber , inputNumber;
  
  wire [7:0] dataMemOut , W_H_data , W_O_data , B_H_data , B_O_data;
  
  DataMemory cut_data_mem(dataNumber , dataMemOut);
  WeightsMemory_Hidden cut_W_H(nodeNumber , inputNumber , W_H_data);
  WeightsMemory_Output cut_W_O(nodeNumber , inputNumber , W_O_data);
  BiasMemory_Hidden cut_B_H(nodeNumber , B_H_data);
  BiasMemory_Output cut_B_O(nodeNumber , B_O_data);
  
  initial begin
    dataNumber = 12; nodeNumber = 2; inputNumber = 15;
    #10;
    $stop;
  end
  
endmodule

