`timescale 1ns / 1ps

module mem8b(
   output reg [7:0] dataout,   //�������
   input cs,                   //Ƭѡ�źţ��ߵ�ƽ��Ч����Чʱ���洢����������
   input clk,                   //ʱ���ź�
   input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
   input [7:0] datain,        //����������
   input [15:0] addr           //16λ�洢����ַ���洢����64KB
);
 reg [7:0] ram [2**16-1:0];  //����ʹ�ÿ�RAM�ۺϳɴ洢��
// Add your code here
endmodule
