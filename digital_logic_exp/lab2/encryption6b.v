`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 16:33:34
// Design Name: 
// Module Name: encryption6b
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


module encryption6b(
    output [7:0] dataout,    //������ܻ���ܺ��8����ASCII���ݡ�
    output reg ready,       //�����Ч��ʶ���ߵ�ƽ˵�������Ч����6���ڸߵ�ƽ
    output [5:0] key,       //���6λ������
    input clk,             // ʱ���źţ���������Ч
    input load,            //����seedָʾ���ߵ�ƽ��Ч
    input [7:0] datain       //�������ݵ�8����ASCII�롣
);
wire  [63:0] seed=64'ha845fd7183ad75c4;       //��ʼ64����seed=64'ha845fd7183ad75c4
//add your code here
endmodule

module lfsr(              //64λ������λ�Ĵ���
	output reg [63:0] dout,
    input  [63:0]  seed,
	input  clk,
	input  load
	);
//add your code here
endmodule
