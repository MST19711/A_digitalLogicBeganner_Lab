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
    output  [15:0] rd_l,        //�������ĵ�16λ
    output out_valid,         //�������ʱ�����Ϊ1
    output in_error,          //�������ʱ�����Ϊ1
    output [6:0] segs,        // 7����ֵ
    output [7:0] AN,         //�����ѡ��
    input clk,               //ʱ�� 
    input rst,               //��λ�źţ�����Ч
    input [3:0] x,           //������1���ظ�8�κ���Ϊrs1
    input [3:0] y,           //������2���ظ�8�κ���Ϊrs2
    input [2:0] funct3,        //3λ����ѡ����
    input in_valid          //����Ϊ1ʱ����ʾ���ݾ�������ʼ����
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
        .rd(result),        //������
        .out_valid(out_valid),         //�������ʱ�����Ϊ1
        .in_error(in_error),          //�������ʱ�����Ϊ1
        .clk(clk),               //ʱ�� 
        .rst(rst),               //��λ�źţ�����Ч
        .rs1({x, x ,x ,x, x, x ,x ,x}),          //������rs1
        .rs2({y, y, y, y, y, y, y, y}),          //������rs2
        .funct3(funct3),        //3λ����ѡ����
        .in_valid(in_valid)           //����Ϊ1ʱ����ʾ���ݾ�������ʼ��������
    );
endmodule
