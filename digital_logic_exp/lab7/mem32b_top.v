`timescale 1ns / 1ps


module mem32b_top(
    output [6:0]SEG,     
    output [7:0]AN,              //��ʾ32λ�����ֵ
    output [15:0] dataout_L8b,   //������ݵ�16λ
    input CLK100MHZ,            //ϵͳʱ���ź�
    input BTNC,                 //��λ�����ź�
    input [2:0] MemOp,          //��д�ֽ��������ź�
    input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
    input [3:0] addr_L4b,           //��ַλ��4λ����λ����ָ��Ϊ0����������ֵ
    input [7:0] datain_L8b          //�������ݵ�8λ�����ظ�4�Σ����λָ��Ϊ����ֵ
 );
 // Add your code here 
    
endmodule
