`timescale 1ns/1ns

module DataMemory #(parameter INPUT_COUNT=62)
                   (input [10:0] dataGroupNumber , output [INPUT_COUNT*8-1:0] data);
  
  reg [7:0] DataMem [0:46499];
  reg [INPUT_COUNT*8-1:0] dataConcat;
  
  initial $readmemh("test_data_sm.dat", DataMem);
  
  integer i;
  always@(dataGroupNumber) begin
    for (i = 0; i < INPUT_COUNT; i = i+1)
        dataConcat[i * 8 +:8] = DataMem[((dataGroupNumber - 1) * INPUT_COUNT) + i];
  end      
  
  assign data = dataConcat; 
   
endmodule

module DataMem(input [10:0] dataGroupNumber , output [4:0] data);
  reg [4:0] DataMem [0:749];
  initial $readmemb("data.dat", DataMem);
  assign data = DataMem[dataGroupNumber - 1];
endmodule