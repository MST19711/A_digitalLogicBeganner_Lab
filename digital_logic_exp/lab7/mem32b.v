`timescale 1ns / 1ps

module mem32b(
   output reg [31:0] dataout,   //输出数据
   input clk,                   //时钟信号
   input we,                   //存储器写使能信号，高电平时允许写入数据
   input [2:0] MemOp,          //读写字节数控制信号
   input [31:0] datain,        //输入数据
   input [15:0] addr           //16位存储器地址
);
// Add your code here

endmodule
