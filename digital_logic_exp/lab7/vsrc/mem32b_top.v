`timescale 1ns / 1ps

`define NVB

module mem32b_top(
`ifdef NVB
    output [7:0] o_seg0,
    output [7:0] o_seg1,
    output [7:0] o_seg2,
    output [7:0] o_seg3,
    output [7:0] o_seg4,
    output [7:0] o_seg5,
    output [7:0] o_seg6,
    output [7:0] o_seg7,
`else
    output [6:0]SEG,     
    output [7:0]AN,              //��ʾ32λ�����ֵ
`endif
    output [15:0] dataout_L16b,   //������ݵ�16λ
    input CLK100MHZ,            //ϵͳʱ���ź�
    input BTNC,                 //��λ�����ź�
    input [2:0] MemOp,          //��д�ֽ��������ź�
    input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
    input [3:0] addr_L4b,           //��ַλ��4λ����λ����ָ��Ϊ0����������ֵ
    input [7:0] datain_L8b          //�������ݵ�8λ�����ظ�4�Σ����λָ��Ϊ����ֵ
 );
 // Add your code here 
    wire [31:0] dataout;
    wire out_valid;
    
    mem32b RAM(
        .dataout(dataout),   //�������
        .clk(CLK100MHZ),                   //ʱ���ź�
        .rst(BTNC),
        .MemOp(MemOp),          //��д�ֽ��������ź�
        .datain({datain_L8b, datain_L8b, datain_L8b, datain_L8b}),        //��������
        .addr({12'd0, addr_L4b}),          //16λ�洢����ַ
        .we(we),
        .out_valid(out_valid)
    );
    
    assign dataout_L16b = dataout[15:0];
`ifdef NVB
    seg nvb_seg(
        .clk(CLK100MHZ),
        .rst(BTNC),
        .num(dataout),
        .o_seg0(o_seg0),
        .o_seg1(o_seg1),
        .o_seg2(o_seg2),
        .o_seg3(o_seg3),
        .o_seg4(o_seg4),
        .o_seg5(o_seg5),
        .o_seg6(o_seg6),
        .o_seg7(o_seg7)
    );
`else
    seg7decimal my_seg7(
        .x(dataout),
        .clk(CLK100MHZ),
        .seg(SEG),
        .an(AN),
        .dp(0)
    );
`endif
endmodule
