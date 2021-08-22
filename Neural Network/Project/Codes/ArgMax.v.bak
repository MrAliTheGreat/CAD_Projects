`timescale 1ns/1ns

module ArgMax(input enMax , input [7:0] in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , input [10:0] dataGroupNumber ,
              output [4:0] max_index);
  
  wire [4:0] data;
  reg [7:0] values [0:9];
  always@(*) begin
    if(enMax) begin
      values[0] = in1; values[1] = in2; values[2] = in3; values[3] = in4; values[4] = in5; values[5] = in6; values[6] = in7; values[7] = in8; 
      values[8] = in9; values[9] = in10;
    end
  end
  
  DataMem cut_mem(dataGroupNumber , data);
  reg [7:0] temp; reg [4:0] index , search; integer i;
  always@(*) begin
    if(enMax) begin
      index = 0; temp = values[0]; search = 1;
      for(i = 0 ; i < 10 ; i = i + 1) begin
        if(values[i] >= temp && search == 1) begin
          temp = values[i]; index = i;
          if(index == data) 
            search = 0;
        end
      end
    end
  end
  
  assign max_index = index;
  
endmodule
