`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/02 12:05:22
// Design Name: 
// Module Name: div_32u
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


module div_32u(
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

    assign in_error = ((X == 0) || (Y == 0)); //预处理，除数和被除数异常检测报错
    reg temp_outval;// = 1'b0;
    assign out_valid = temp_outval || in_error;
    reg [5:0] cnt = 0;
    reg [31:0] q, r;
    assign Q = q;
    assign R = r;
    wire [31:0] rmY;
    assign rmY = r - Y;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cnt <= 0;
            temp_outval <= 0;
        end 
        if(in_valid) begin
            {r, q} <= {32'b0, X};
            cnt <= 33;
            temp_outval <= 0;
        end
        if(in_error == 0) begin
            if(cnt == 0 && in_valid == 0 && temp_outval) begin
                temp_outval <= 1;
                r <= {1'b0, r[31:1]};
            end
            if(in_valid == 0 && cnt != 0) begin
                cnt <= cnt - 1;
                if(r >= Y) begin
                    {r, q} <= {rmY[30:0], q, 1'b1};
                end else begin
                    {r, q} <= {r[30:0], q, 1'b0};
                end
            end
        end
    end
// add your code here
endmodule
