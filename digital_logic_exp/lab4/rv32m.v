`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/05 10:12:50
// Design Name: 
// Module Name: rv32m
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


module rv32m(
    output  [31:0] rd,        //������
    output out_valid,         //�������ʱ�����Ϊ1
    output in_error,          //�������ʱ�����Ϊ1
    input clk,               //ʱ�� 
    input rst,               //��λ�źţ�����Ч
    input [31:0] rs1,          //������rs1
    input [31:0] rs2,          //������rs2
    input [2:0] funct3,        //3λ����ѡ����
    input in_valid           //����Ϊ1ʱ����ʾ���ݾ�������ʼ��������
    );
    //add your code here
    wire out_valid_w[0:7];
    wire in_error_w[0:7];
    wire [31:0]rd_w[0:7];
    reg [31:0] out_rd;
    assign rd = out_rd;
    reg out_valid_r, in_error_r;
    assign out_valid = out_valid_r;
    assign in_error = in_error_r;
    always @(*) begin
        case (funct3)
            3'b000: begin 
                out_rd <= rd_w[0]; 
                out_valid_r <= out_valid_w[0];
                in_error_r <= in_error_w[0];
            end
            3'b001: begin 
                out_rd <= rd_w[1]; 
                out_valid_r <= out_valid_w[1]; 
                in_error_r <= in_error_w[1];
            end
            3'b010: begin 
                out_rd <= rd_w[2]; 
                out_valid_r <= out_valid_w[2]; 
                in_error_r <= in_error_w[2];
            end
            3'b011: begin
                out_rd <= rd_w[3]; 
                out_valid_r <= out_valid_w[3]; 
                in_error_r <= in_error_w[3];
            end
            3'b100: begin 
                out_rd <= rd_w[4]; 
                out_valid_r <= out_valid_w[4];
                in_error_r <= in_error_w[4];
            end
            3'b101: begin 
                out_rd <= rd_w[5]; 
                out_valid_r <= out_valid_w[5]; 
                in_error_r <= in_error_w[5];
            end
            3'b110: begin 
                out_rd <= rd_w[6]; 
                out_valid_r <= out_valid_w[6]; 
                in_error_r <= in_error_w[6];
            end
            3'b111: begin 
                out_rd <= rd_w[7];
                out_valid_r = out_valid_w[7];
                in_error_r = in_error_w[7];
            end
        endcase
    end
    mul_32b mul32b_0(
        .p({rd_w[1], rd_w[0]}),         //�˻�
        .out_valid(out_valid_w[0]),        //�ߵ�ƽ��Чʱ����ʾ�˷�����������
        .clk(clk),              //ʱ�� 
        .rst_n(rst),             //��λ�źţ�����Ч
        .x(rs1),           //������
        .y(rs2),           //����
        .in_valid(in_valid)           //�ߵ�ƽ��Ч����ʾ�˷�����ʼ����
    ); 
    assign in_error_w[0] = 0;
    assign out_valid_w[1] = out_valid_w[0];
    wire [63:0]mulu_res_unsigned, mulu_res_signed;
    mul_32b mul32b_1(
        .p(mulu_res_unsigned),         //�˻�
        .out_valid(out_valid_w[2]),        //�ߵ�ƽ��Чʱ����ʾ�˷�����������
        .clk(clk),              //ʱ�� 
        .rst_n(rst),             //��λ�źţ�����Ч
        .x((rs1[31] == 0 ? rs1 : (~rs1 + 1))),           //������
        .y(rs2),           //����
        .in_valid(in_valid)           //�ߵ�ƽ��Ч����ʾ�˷�����ʼ����
    ); 
    assign in_error_w[1] = 0;
    assign in_error_w[2] = 0;
    assign mulu_res_signed = (rs1[31] == 0 ? mulu_res_unsigned : (~mulu_res_unsigned + 1));
    assign rd_w[2] = mulu_res_signed[63:32];
    wire [63:0]mul32k_res_unsigned;
    mul_32k mul32k_0(
        .X(rs1), 
        .Y(rs2),
        .P(mul32k_res_unsigned)       // output variable for assignment
    );
    assign rd_w[3] = mul32k_res_unsigned[63:32];
    assign out_valid_w[3] = 1;
    assign in_error_w[3] = 0;
    div_32b div32s_0(
        .Q(rd_w[4]),          
        .R(rd_w[6]),         
        .out_valid(out_valid_w[4]),        
        .in_error(in_error_w[4]),       
        .clk(clk), 
        .rst(rst),      
        .X(rs1),           
        .Y(rs2),       
        .in_valid(in_valid)        
    );
    assign out_valid_w[6] = out_valid_w[4];
    assign in_error_w[6] = in_error_w[4];
    div_32u div32u_0(
        .Q(rd_w[5]),          //??
        .R(rd_w[7]),          //????
        .out_valid(out_valid_w[5]),        //??????????????????1
        .in_error(in_error_w[5]),         //????????????0???????1
        .clk(clk),               //??? 
        .rst(rst),             //??��???
        .X(rs1),           //??????
        .Y(rs2),           //????
        .in_valid(in_valid)          //?????1??????????????????????????
    );
    assign out_valid_w[7] = out_valid_w[5];
    assign in_error_w[7] = in_error_w[5];
endmodule
