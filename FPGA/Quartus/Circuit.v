`timescale 1ns/1ns

module Circuit2(input clk , rst , start ,
               input A3 , A2 , A1 , A0 , B3 , B2 , B1 , B0 ,
               output out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);
  
  wire rst_out , ld_A , ld_B , l_1 , l_2 , shctrl_1 , shctrl_0 , ld_out;
  
  Datapath cut_datapath(clk , rst_out , ld_A , ld_B , l_1 , l_2 , shctrl_1 , shctrl_0 , ld_out ,
                        A3 , A2 , A1 , A0 , B3 , B2 , B1 , B0 ,
                        out7 , out6 , out5 , out4 , out3 , out2 , out1 , out0);  
  
  Controller cut_controller(clk , rst , start , rst_out , ld_A , ld_B , l_1 , l_2 , shctrl_1 , shctrl_0 , ld_out);
  
endmodule
