`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 21:13:09
// Design Name: 
// Module Name: dec7seg
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

`define seg_0 (~I[0]&~I[1]&~I[2]&~I[3])
`define seg_1 (~I[0]&~I[1]&~I[2]&I[3])
`define seg_2 (~I[0]&~I[1]&I[2]&~I[3])
`define seg_3 (~I[0]&~I[1]&I[2]&I[3])
`define seg_4 (~I[0]&I[1]&~I[2]&~I[3])
`define seg_5 (~I[0]&I[1]&~I[2]&I[3])
`define seg_6 (~I[0]&I[1]&I[2]&~I[3])
`define seg_7 (~I[0]&I[1]&I[2]&I[3])
`define seg_8 (I[0]&~I[1]&~I[2]&~I[3])
`define seg_9 (I[0]&~I[1]&~I[2]&I[3])
`define seg_A (I[0]&~I[1]&I[2]&~I[3])
`define seg_B (I[0]&~I[1]&I[2]&I[3])
`define seg_C (I[0]&I[1]&~I[2]&~I[3])
`define seg_D (I[0]&I[1]&~I[2]&I[3])
`define seg_E (I[0]&I[1]&I[2]&~I[3])
`define seg_F (I[0]&I[1]&I[2]&I[3])

module decoder_seg(
                input [3:0] I,
                output [6:0] seg
            );
    assign seg[0] = `seg_1 | `seg_4 | `seg_B | `seg_D;
    assign seg[1] = `seg_5 | `seg_6 | `seg_B | `seg_C | `seg_E | `seg_F;
    assign seg[2] = `seg_2 | `seg_C | `seg_E | `seg_F;
    assign seg[3] = `seg_1 | `seg_4 | `seg_7 | `seg_A | `seg_F;
    assign seg[4] = `seg_1 | `seg_3 | `seg_4 | `seg_5 | `seg_7 | `seg_9;
    assign seg[5] = `seg_1 | `seg_2 | `seg_3 | `seg_7 | `seg_D;
    assign seg[6] = `seg_0 | `seg_1 | `seg_7 | `seg_C;
endmodule

module decoder_3to8(
            input [2:0] INPUT,
            output [7:0] OUT
        );
    wire [3:0] I;
    assign I = {INPUT[0], INPUT[1], INPUT[2], 1'b0};
    assign OUT[0] = ~`seg_0;
    assign OUT[1] = ~`seg_1;
    assign OUT[2] = ~`seg_2;
    assign OUT[3] = ~`seg_3;
    assign OUT[4] = ~`seg_4;
    assign OUT[5] = ~`seg_5;
    assign OUT[6] = ~`seg_6;
    assign OUT[7] = ~`seg_7;
endmodule

module dec7seg(
//�˿�����
output  reg  [6:0] O_seg,  //7λ��ʾ�����
output  reg  [7:0] O_led,  //8��������������
input   [3:0] I,           //4λ�������룬��Ҫ��ʾ������   
input   [2:0] S          //3λ����ѡ��ָ���������ʾ
); 
// add your code here
    wire [6:0] BUS2SEG;
    wire [7:0] led_chose;
    decoder_seg dec0(
        .I(I),
        .seg(BUS2SEG)
    );
    decoder_3to8 dec1(
        .INPUT(S),
        .OUT(led_chose)
    );
    always @(*) begin
        O_seg = BUS2SEG;
        O_led = led_chose;
    end
endmodule
