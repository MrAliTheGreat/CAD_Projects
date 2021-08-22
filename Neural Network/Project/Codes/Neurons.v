`timescale 1ns/1ns

module Neurons #(parameter INPUT_COUNT=62 , parameter H_NODE_NUMBER = 20 , parameter O_NODE_NUMBER = 10)
              (input clk , start_signal , input [1:0] ctrl_data_w_b_neuron ,
               input [INPUT_COUNT*8-1:0] inputs , input [H_NODE_NUMBER*8-1:0] out_regs , 
               input [INPUT_COUNT*H_NODE_NUMBER*8-1:0] H_weights , input [H_NODE_NUMBER*O_NODE_NUMBER*8-1:0] O_weights ,
               input [H_NODE_NUMBER*8-1:0] H_bias , [O_NODE_NUMBER*8-1:0] O_bias,
               output [7:0] out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8 , out9 , out10 , 
               output ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10);
               
  reg [INPUT_COUNT*8-1:0] H_weights_neuron [0:H_NODE_NUMBER - 1];
  reg [H_NODE_NUMBER*8-1:0] O_weights_neuron [0:O_NODE_NUMBER - 1];
  reg [7:0] H_bias_neuron [0:H_NODE_NUMBER - 1];
  reg [7:0] O_bias_neuron [0:O_NODE_NUMBER - 1];
  
  integer i;
  always@(*) begin
    for (i = 0; i < H_NODE_NUMBER; i = i+1)
        H_weights_neuron[i] = H_weights[(i * INPUT_COUNT * 8) +:INPUT_COUNT*8];
    
    for (i = 0; i < O_NODE_NUMBER; i = i+1)
        O_weights_neuron[i] = O_weights[(i * H_NODE_NUMBER * 8) +:H_NODE_NUMBER*8];

    for (i = 0; i < H_NODE_NUMBER; i = i+1)
        H_bias_neuron[i] = H_bias[(i * 8) +:8];
    
    for (i = 0; i < O_NODE_NUMBER; i = i+1)
        O_bias_neuron[i] = O_bias[(i * 8) +:8]; 
  end
  
  // 2'b00 : hidden upper half , 2'b01 : hidden lower half , 2'b10 : output layer
  
  // Data
  wire [INPUT_COUNT*8-1:0] data_neuron = (ctrl_data_w_b_neuron == 2'b00) ? inputs :
                                         (ctrl_data_w_b_neuron == 2'b01) ? inputs :
                                         (ctrl_data_w_b_neuron == 2'b10) ? out_regs: 496'bz;
  
  // Weights
  wire [INPUT_COUNT*8-1:0] weights1 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[0] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[10] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[0]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights2 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[1] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[11] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[1]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights3 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[2] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[12] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[2]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights4 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[3] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[13] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[3]: 496'bz;

  wire [INPUT_COUNT*8-1:0] weights5 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[4] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[14] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[4]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights6 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[5] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[15] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[5]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights7 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[6] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[16] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[6]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights8 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[7] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[17] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[7]: 496'bz;
                                      
  wire [INPUT_COUNT*8-1:0] weights9 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[8] :
                                      (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[18] :
                                      (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[8]: 496'bz;
  
  wire [INPUT_COUNT*8-1:0] weights10 = (ctrl_data_w_b_neuron == 2'b00) ? H_weights_neuron[9] :
                                       (ctrl_data_w_b_neuron == 2'b01) ? H_weights_neuron[19] :
                                       (ctrl_data_w_b_neuron == 2'b10) ? O_weights_neuron[9]: 496'bz;
                                       
  // Biases

  wire [7:0] bias1 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[0] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[10] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[0]: 8'bz;
  
  wire [7:0] bias2 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[1] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[11] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[1]: 8'bz;
  
  wire [7:0] bias3 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[2] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[12] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[2]: 8'bz;
  
  wire [7:0] bias4 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[3] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[13] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[3]: 8'bz;

  wire [7:0] bias5 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[4] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[14] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[4]: 8'bz;
  
  wire [7:0] bias6 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[5] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[15] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[5]: 8'bz;
  
  wire [7:0] bias7 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[6] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[16] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[6]: 8'bz;
  
  wire [7:0] bias8 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[7] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[17] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[7]: 8'bz;
                                      
  wire [7:0] bias9 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[8] :
                     (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[18] :
                     (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[8]: 8'bz;
  
  wire [7:0] bias10 = (ctrl_data_w_b_neuron == 2'b00) ? H_bias_neuron[9] :
                      (ctrl_data_w_b_neuron == 2'b01) ? H_bias_neuron[19] :
                      (ctrl_data_w_b_neuron == 2'b10) ? O_bias_neuron[9]: 8'bz;
  
  
  neuron_ip cut_neuron1(.inputs(data_neuron), .weights(weights1),.bias(bias1) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out1), .ready_signal(ready1));
  
  neuron_ip cut_neuron2(.inputs(data_neuron), .weights(weights2),.bias(bias2) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out2), .ready_signal(ready2));
  
  neuron_ip cut_neuron3(.inputs(data_neuron), .weights(weights3),.bias(bias3) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out3), .ready_signal(ready3));
  
  neuron_ip cut_neuron4(.inputs(data_neuron), .weights(weights4),.bias(bias4) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out4), .ready_signal(ready4));
 
  neuron_ip cut_neuron5(.inputs(data_neuron), .weights(weights5),.bias(bias5) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out5), .ready_signal(ready5));
  
  neuron_ip cut_neuron6(.inputs(data_neuron), .weights(weights6),.bias(bias6) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out6), .ready_signal(ready6));
  
  neuron_ip cut_neuron7(.inputs(data_neuron), .weights(weights7),.bias(bias7) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out7), .ready_signal(ready7));
  
  neuron_ip cut_neuron8(.inputs(data_neuron), .weights(weights8),.bias(bias8) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out8), .ready_signal(ready8));
  
  neuron_ip cut_neuron9(.inputs(data_neuron), .weights(weights9),.bias(bias9) , .ctrl_data(ctrl_data_w_b_neuron) ,
                        .start_signal(start_signal), .clk(clk), .out(out9), .ready_signal(ready9));
  
  neuron_ip cut_neuron10(.inputs(data_neuron), .weights(weights10),.bias(bias10) , .ctrl_data(ctrl_data_w_b_neuron) ,
                         .start_signal(start_signal), .clk(clk), .out(out10), .ready_signal(ready10));
endmodule
