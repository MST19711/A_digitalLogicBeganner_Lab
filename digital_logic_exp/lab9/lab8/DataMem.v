`timescale 1ns / 1ps

module DataMem(
   output reg [31:0] dataout,      //�������
   input clk,                   //ʱ���ź�
   input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
   input [2:0] MemOp,          //��д�ֽ�������
   input [31:0] datain,          //����������
   input [15:0] addr            //�洢����ַ
);
(* ram_style="block" *)  reg [31:0] ram [2**16-1:0];  //����ʹ�ÿ�RAM�ۺϳɴ洢��

//Add your code here
endmodule
