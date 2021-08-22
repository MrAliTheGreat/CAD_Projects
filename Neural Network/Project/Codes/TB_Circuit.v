`timescale 1ns/1ns

module TB_Circuit();
  reg clk = 1 , start_circuit = 0;
  reg [10:0] dataGroupNumber = 1;
  reg [4:0] answers [0:749];
  
  wire ready_circuit;
  wire [4:0] max_index;
    
  Circuit cut_circuit(clk , start_circuit , dataGroupNumber , ready_circuit , max_index);
  
  always #20 clk =~ clk;
  initial begin
    repeat(20) begin
      #40 start_circuit = 1;
      #40 start_circuit = 0;
      #10000 dataGroupNumber = dataGroupNumber + 1; answers[dataGroupNumber - 1] = max_index;
    end
    $writememb("Answers.txt", answers);
    $stop;
  end  
  
endmodule
