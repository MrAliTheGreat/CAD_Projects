`timescale 1ns/1ns

module Circuit(input clk , start_circuit , input [10:0] dataGroupNumber , output ready_circuit , output [4:0] max_index);
  
  wire start_neurons , ld_regs1 , ld_regs2 , enMax , rst_hidden_regs;
  wire ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10;
  wire [1:0] ctrl_w_b_data_neuron;
  
  Datapath cut_datapath(clk , rst_hidden_regs , start_neurons , ld_regs1 , ld_regs2 , enMax , ctrl_w_b_data_neuron , 
                        dataGroupNumber ,
                        ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10 , 
                        max_index);
                  
                  
  CircuitController cut_controll(clk , start_circuit , ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10 ,
                                 rst_hidden_regs , start_neurons , ld_regs1 , ld_regs2 , ready_circuit , enMax , 
                                 ctrl_w_b_data_neuron);
  
endmodule
