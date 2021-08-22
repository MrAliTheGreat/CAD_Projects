`timescale 1ns/1ns

module IterativeFib(input start , clk , input[3:0] n , output reg ready , output [10:0] out);
  reg [10:0] previous, current;
  reg [3:0] counter;
  reg [1:0] ns , ps;
  
  // Calculating nth Fibonacci number
  always @(posedge clk) begin
    if(ps == 2'b10) begin
      counter <= counter + 1;
      current <= current + previous;
      previous <= current;
    end 
  end
  
  // Assigning control values
  always @(ps) begin
    ready = 1'b0;
    case(ps)
      2'b00: ready = 1;
      2'b01: begin
        previous = 11'd0;
        current = 11'd1;
        counter = 2;
      end
      2'b10: begin
        ps = 2'b10;
      end
      default ps = 2'b00;
    endcase
  end  
  
  // Changing states conditionally
  always @(ps , start , counter) begin
    case(ps)
      2'b00: ns = start ? 2'b01 : 2'b00;
      2'b01: ns = 2'b10;
      2'b10: ns = (counter == n)? 2'b00 : 2'b10;
      default ps = 2'b00;
    endcase
  end
  
  // Change present state
  always @(posedge clk) begin
    ps <= ns;
  end
  
  // Assigning to output
  assign out = current;
  
endmodule

