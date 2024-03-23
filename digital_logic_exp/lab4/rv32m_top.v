`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/05 10:13:11
// Design Name: 
// Module Name: rv32m_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rv32m_top(
    output rst_display,
    output  [15:0] rd_l,        //运算结果的低16位
    output out_valid,         //运算结束时，输出为1
    output in_error,          //运算出错时，输出为1
    output [6:0] segs,        // 7段数值
    output [7:0] AN,         //数码管选择
    input clk,               //时钟 
    input rst,               //复位信号，低有效
    input [3:0] x,           //操作数1，重复8次后作为rs1
    input [3:0] y,           //操作数2，重复8次后作为rs2
    input [2:0] funct3,        //3位功能选择码
    input in_valid          //输入为1时，表示数据就绪，开始运算
    );
    //add your code here
    assign rst_display = rst;
    wire [31 : 0] result;
    assign rd_l = result[15:0];
    seg_display seg0(
        .I0(result[31:28]),
        .I1(result[27:24]),
        .I2(result[23:20]),
        .I3(result[19:16]),
        .I4(result[15:12]),
        .I5(result[11:8]),
        .I6(result[7:4]),
        .I7(result[3:0]),
        .clk(clk),
        .segs(segs),           
        .AN(AN)
    );
    rv32m rv32m_0(
        .rd(result),        //运算结果
        .out_valid(out_valid),         //运算结束时，输出为1
        .in_error(in_error),          //运算出错时，输出为1
        .clk(clk),               //时钟 
        .rst(rst),               //复位信号，低有效
        .rs1({x, x ,x ,x, x, x ,x ,x}),          //操作数rs1
        .rs2({y, y, y, y, y, y, y, y}),          //操作数rs2
        .funct3(funct3),        //3位功能选择码
        .in_valid(in_valid)           //输入为1时，表示数据就绪，开始除法运算
    );
endmodule
