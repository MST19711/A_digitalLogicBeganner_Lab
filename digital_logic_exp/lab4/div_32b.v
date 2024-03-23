`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/05 09:57:33
// Design Name: 
// Module Name: div_32b
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


module div_32b(
    output  [31:0] Q,          //��
    output  [31:0] R,          //����
    output out_valid,        //�����������ʱ�����Ϊ1
    output in_error,         //�����������Ϊ0ʱ�����Ϊ1
    input clk,               //ʱ�� 
    input rst,             //��λ�ź�
    input [31:0] X,           //������
    input [31:0] Y,           //����
    input in_valid          //����Ϊ1ʱ����ʾ���ݾ�������ʼ��������
);
    //add your code here 
    wire [31:0] x_in, y_in;
    assign x_in = (X[31] == 1) ? (~X) + 1 : X;
    assign y_in = (Y[31] == 1) ? (~Y) + 1 : Y;
    wire [31:0] Q_abs;
    assign Q = (X[31] ^ Y[31]) ? (~Q_abs) + 1 : Q_abs;
    wire [31:0] R_abs;
    assign R = (X[31] == 1) ? (~R_abs) + 1 : R_abs;
    div_32u dev_32u_0(
        .Q(Q_abs),          //��
        .R(R_abs),          //����
        .out_valid(out_valid),        //�����������ʱ�����Ϊ1
        .in_error(in_error),         //�����������Ϊ0ʱ�����Ϊ1
        .clk(clk),               //ʱ�� 
        .rst(rst),             //��λ�ź�
        .X(x_in),           //������
        .Y(y_in),           //����
        .in_valid(in_valid)         
    );
endmodule
