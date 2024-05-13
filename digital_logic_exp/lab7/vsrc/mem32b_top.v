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
    output [7:0]AN,              //显示32位输出数值
`endif
    output [15:0] dataout_L16b,   //输出数据低16位
    input CLK100MHZ,            //系统时钟信号
    input BTNC,                 //复位清零信号
    input [2:0] MemOp,          //读写字节数控制信号
    input we,                   //存储器写使能信号，高电平时允许写入数据
    input [3:0] addr_L4b,           //地址位低4位，高位可以指定为0或其他任意值
    input [7:0] datain_L8b          //输入数据低8位，可重复4次，或高位指定为任意值
 );
 // Add your code here 
    wire [31:0] dataout;
    wire out_valid;
    
    mem32b RAM(
        .dataout(dataout),   //输出数据
        .clk(CLK100MHZ),                   //时钟信号
        .rst(BTNC),
        .MemOp(MemOp),          //读写字节数控制信号
        .datain({datain_L8b, datain_L8b, datain_L8b, datain_L8b}),        //输入数据
        .addr({12'd0, addr_L4b}),          //16位存储器地址
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
