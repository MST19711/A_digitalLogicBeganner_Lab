`timescale 1ns / 1ps

module mem32b(
   output [31:0] dataout,   //�������??
   input clk,                   //ʱ���ź�
   input [2:0] MemOp,          //��д�ֽ��������ź�
   input [31:0] datain,        //��������
   input [15:0] addr,          //16λ�洢����ַ
   input we
);
// Add your code here
   wire [3:0] we_W_T;
   wire [3:0] we_W;
   wire [31:0] outwire;
   wire [31:0] out_valid_w;
  generate
      genvar i;
      for(i = 0; i < 4; i = i+1)begin
         mem8b sub_mem_0(
            .dataout(outwire[7 + (i * 8):i * 8]),  //outwire[7 + (((i + 4 - (addr % 4)) % 4) * 8):((i + 4 - (addr % 4)) % 4) * 8]
            .cs(1),                  
            .clk(clk),                  
            .we(we_W[i]),                
            .datain(datain[7 + (i * 8) :i * 8]),      
            .addr((addr % 4) > i ? (addr / 4) + 1 : (addr / 4))    
         );
      end
   endgenerate
   assign out_valid = 1;
   
   assign we_W_T = 
               MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
               MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
               MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
               MemOp == 3'b100 ? (4'd0000) :
               MemOp == 3'b101 ? (4'd0000) :
               0;
   assign we_W[0] = (addr % 4) == 0 ? we_W_T[0]:
                     (addr % 4) == 1 ? we_W_T[3]:
                     (addr % 4) == 2 ? we_W_T[2]: 
                     we_W_T[1];
   assign we_W[1] = (addr % 4) == 0 ? we_W_T[1]:
                     (addr % 4) == 1 ? we_W_T[0]:
                     (addr % 4) == 2 ? we_W_T[3]:
                     we_W_T[2];
   assign we_W[2] = (addr % 4) == 0 ? we_W_T[2]:
                     (addr % 4) == 1 ? we_W_T[1]:
                     (addr % 4) == 2 ? we_W_T[0]:
                     we_W_T[3];
   assign we_W[3] = (addr % 4) == 0 ? we_W_T[3]:
                     (addr % 4) == 1 ? we_W_T[2]:
                     (addr % 4) == 2 ? we_W_T[1]:
                      we_W_T[0];

   wire [31:0] outW_T;
   assign outW_T[7:0] = (addr % 4) == 0 ? outwire[7:0]:
                        (addr % 4) == 1 ? outwire[15:8]:
                        (addr % 4) == 2 ? outwire[23:16]:
                        outwire[31:24];
   assign outW_T[15:8] = (addr % 4) == 0 ? outwire[15:8]:
                        (addr % 4) == 1 ? outwire[23:16]:
                        (addr % 4) == 2 ? outwire[31:24]:
                        outwire[7:0];
   assign outW_T[23:16] = (addr % 4) == 0 ? outwire[23:16]:
                        (addr % 4) == 1 ? outwire[31:24]:
                        (addr % 4) == 2 ? outwire[7:0]:
                        outwire[15:8];
   assign outW_T[31:24] = (addr % 4) == 0 ? outwire[31:24]:
                        (addr % 4) == 1 ? outwire[7:0]:
                        (addr % 4) == 2 ? outwire[15:8]:
                        outwire[23:16];
   assign dataout = 
                  MemOp == 3'b000 ? ({outW_T[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outW_T[7:0]}) :
                  MemOp == 3'b001 ? ({outW_T[15] == 1 ? 16'b1111111111111111 : 16'd0, outW_T[15:0]}) :
                  MemOp == 3'b010 ? (outW_T[31:0]) :
                  MemOp == 3'b100 ? ({24'd0, outW_T[7:0]}) :
                  MemOp == 3'b101 ? ({16'd0, outW_T[15:0]}) :
                  0;
endmodule
