`timescale 1ns/1ns

module Datapath #(parameter INPUT_COUNT=62 , parameter H_NODE_NUMBER = 20 , parameter O_NODE_NUMBER = 10)
                 (input clk , rst , startNeurons , ld_regs1 , ld_regs2 , enMax , input [1:0] ctrl_w_b_data_neuron , 
                  input [10:0] dataGroupNumber ,
                  output ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10 , 
                  output [4:0] max_index);
                 
  wire [INPUT_COUNT*8-1:0] data;
  wire [INPUT_COUNT*H_NODE_NUMBER*8-1:0] H_weights;
  wire [H_NODE_NUMBER*O_NODE_NUMBER*8-1:0] O_weights;
  wire [H_NODE_NUMBER*8-1:0] H_bias;
  wire [O_NODE_NUMBER*8-1:0] O_bias;
  wire [H_NODE_NUMBER*8-1:0] out_concat_regs;
  wire [7:0] out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10;
  
  Neurons cut_neurons(clk , startNeurons , ctrl_w_b_data_neuron , 
                      data , out_concat_regs , 
                      H_weights , O_weights ,
                      H_bias , O_bias ,
                      out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , 
                      ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10);
                      
  HiddenRegs cut_hidden_regs(clk , rst , ld_regs1 , ld_regs2 ,
                             out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 ,
                             out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , out_concat_regs);
  
  DataMemory cut_dataMem(dataGroupNumber , data);
  
  WeightsMemory_Hidden cut_weights_hidden(H_weights);
  
  WeightsMemory_Output cut_weights_output(O_weights);
  
  BiasMemory_Hidden cut_bias_hidden(H_bias);
  
  BiasMemory_Output cut_bias_output(O_bias);
  
  ArgMax cut_argMax(enMax , out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , dataGroupNumber ,
                    max_index); 
  
  
endmodule
