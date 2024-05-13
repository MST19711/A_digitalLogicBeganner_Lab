`timescale 1ns / 1ps

module mem32b(
   output [31:0] dataout,   //输出数据
   output out_valid,
   input clk,                   //时钟信号
   input rst,
   input [2:0] MemOp,          //读写字节数控制信号
   input [31:0] datain,        //输入数据
   input [15:0] addr,          //16位存储器地址
   input we
);
// Add your code here
   wire [3:0] we_W;
   wire [31:0] outwire;
   wire [3:0] out_valid_w;
   generate
      genvar i;
      for(i = 0; i < 4; i ++)begin
         mem8b sub_mem_0(
            .dataout(outwire[7 + (i * 8):i * 8]),  
            .cs(1),                  
            .clk(clk),                  
            .we(we_W[i]),                
            .datain(datain[7 + (i * 8):i * 8]),      
            .addr(addr),         
            .rst(rst),
            .out_valid(out_valid_w[i])
         );
      end
   endgenerate
   assign out_valid = out_valid_w[0] & out_valid_w[1] & out_valid_w[2] & out_valid_w[3];
   assign we_W = 
               MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
               MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
               MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
               MemOp == 3'b100 ? (4'd0000) :
               MemOp == 3'b101 ? (4'd0000) :
               0;
   assign dataout = 
                  MemOp == 3'b000 ? ({outwire[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outwire[7:0]}) :
                  MemOp == 3'b001 ? ({outwire[15] == 1 ? 16'b1111111111111111 : 16'd0, outwire[15:0]}) :
                  MemOp == 3'b010 ? (outwire[31:0]) :
                  MemOp == 3'b100 ? ({outwire[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outwire[7:0]}) :
                  MemOp == 3'b101 ? ({outwire[15] == 1 ? 16'b1111111111111111 : 16'd0, outwire[15:0]}) :
                  0;
endmodule
