`timescale 1ns/1ns

module CircuitController(input clk , start_circuit , ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10 ,
                         output reg rst_hidden_regs , start_neurons , ld_regs1 , ld_regs2 , ready_circuit , enMax , 
                         output reg [1:0] ctrl_w_b_data_neuron);
  
  reg [3:0] ns , ps;
  
  always @(ps , start_circuit , ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10) begin
    case(ps)
      4'b0000: ns = start_circuit ? 4'b0001 : 4'b0000;
      4'b0001: ns = 4'b0010;
      4'b0010: ns = ({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111) ? 4'b0011 : 4'b0010;
      4'b0011: ns = 4'b0100;
      4'b0100: ns = 4'b0101;
      4'b0101: ns = ({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111) ? 4'b0110 : 4'b0101;
      4'b0110: ns = 4'b0111;
      4'b0111: ns = 4'b1000;
      4'b1000: ns = ({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111) ? 4'b1001 : 4'b1000;
      4'b1001: ns = 4'b0000;
      default ps = 4'b0000;
    endcase
  end
  
  always @(ps , ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10) begin
    {rst_hidden_regs , start_neurons , ld_regs1 , ld_regs2 , ready_circuit , enMax} = 6'b0; ctrl_w_b_data_neuron = 2'b11;
    case(ps)
      4'b0000: ready_circuit = 1;
      4'b0001: {start_neurons , rst_hidden_regs} = 2'b11;
      4'b0010: begin
        ctrl_w_b_data_neuron = 2'b00;
        if({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111)
          ld_regs1 = 1;
      end
      4'b0011: ld_regs1 = 0;
      4'b0100: start_neurons = 1;
      4'b0101: begin
        ctrl_w_b_data_neuron = 2'b01;
        if({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111)
          ld_regs2 = 1;        
      end
      4'b0110: ld_regs2 = 0;
      4'b0111: start_neurons = 1;
      4'b1000: begin
        ctrl_w_b_data_neuron = 2'b10;
        if({ready1 , ready2 , ready3 , ready4 , ready5 , ready6 , ready7 , ready8 , ready9 , ready10} == 10'b1111111111)
          enMax = 1;        
      end
      4'b1001: enMax = 0;
      default ps = 2'b00;
    endcase
  end   
  
  always @(posedge clk) begin
    ps <= ns;
  end   
  
endmodule
