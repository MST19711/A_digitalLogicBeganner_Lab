`timescale 1ns / 1ps

module mem32b(
   output reg [31:0] dataout,   //�������
   input clk,                   //ʱ���ź�
   input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
   input [2:0] MemOp,          //��д�ֽ��������ź�
   input [31:0] datain,        //��������
   input [15:0] addr           //16λ�洢����ַ
);
// Add your code here

endmodule
