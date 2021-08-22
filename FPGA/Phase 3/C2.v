`timescale 1ns/1ns

module C2(input D00 , D01 , D10 , D11 , A1 , B1 , A0 , B0 , output out);

  assign out = ({(A1 | B1) , (A0 & B0)} == 2'b00) ? D00 :
               ({(A1 | B1) , (A0 & B0)} == 2'b01) ? D01 :
               ({(A1 | B1) , (A0 & B0)} == 2'b10) ? D10 : D11;
    
endmodule

