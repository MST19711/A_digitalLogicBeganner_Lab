`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 13:48:41
// Design Name: 
// Module Name: DigitalTimer
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


module DigitalTimer(  //�˿�����
  input clk,
  input rst,            //��λ����Ч��00:00:00
  input [1:0] s,        // =00ʱ�����뼼����01������Сʱ��10�����÷��ӣ�11��������
  input [3:0] data_h,   //���ó�ֵ��λ��ʹ��BCD���ʾ
  input [3:0] data_l,   //���ó�ֵ��λ��ʹ��BCD���ʾ
  output [6:0] segs,   //�߶����������ֵ����ʾ����
  output [7:0] an,     //�߶�����ܿ���λ������ʱ���֡��� 
  output [2:0] ledout   //���3ɫָʾ��
); 
// Add your code

endmodule


