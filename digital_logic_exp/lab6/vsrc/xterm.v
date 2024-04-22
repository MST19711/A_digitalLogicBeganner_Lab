`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 17:02:23
// Design Name: 
// Module Name: xterm
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


module xterm(
    input CLK100MHZ,   //ϵͳʱ���ź�
    input PS2_CLK,    //���Լ��̵�ʱ���ź�
    input PS2_DATA,  //���Լ��̵Ĵ�������λ
    input BTNC,      //Reset
    output [15:0] LED,   //��ʾ����״̬
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output  VGA_HS,
    output  VGA_VS//,
    // VGA output valid for nvboard
    //output VALID
);
// Add your code here

    wire [2:0] state;
    wire [31:0] vram_addr;
    wire [11:0] vram_output [4:0];
    wire pix_clk;
    
    clk_wiz_0 myvgaclk(.clk_in1(CLK100MHZ),.reset(BTNC),.locked(LOCK),.clk_out1(pix_clk));
    VGASim display(
        .ram_addr(vram_addr),
        .CLK(pix_clk),
        .BTNC(BTNC),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VALID(VALID),
        .vramd_read(vram_output[state])
    );
    wire [7:0] ascii_input;
    wire [10:0] kbsig_input;
    // verilator lint_on INITIALDLY
    //assign LED[4:0] = kbsig_input;
    //assign LED[12:5] = ascii_input;
    //assign LED[13] = PS2_CLK;
    wire kbinput_available;
    KeyboardSim keyboard_0(
        .CLK100MHZ(CLK100MHZ),   //系统时钟信号
        .PS2_CLK(PS2_CLK),    //来自键盘的时钟信�?
        .PS2_DATA(PS2_DATA),  //来自键盘的串行数据位
        .BTNC(BTNC),      //Reset
        .ascii_out(ascii_input),
        .kb_sig(kbsig_input),
        .ascii_available(kbinput_available)
    );
    
    term_man term(
        .addra({vram_addr}),
        .ascii_in(ascii_input),
        .kbsig({5'b00000, kbsig_input}),
        .clk(CLK100MHZ),
        .in_valid(kbinput_available),
        .douta(vram_output[0]),
        .state(state)
    );
    Graphic G(.clka(pix_clk),
                    .ena(1'b1),
                    .wea(1'b0),
                    .addra({vram_addr}),
                    .dina(12'd0),
                    .douta(vram_output[1])
    );
    img I(.clka(pix_clk),
                    .ena(1'b1),
                    .wea(1'b0),
                    .addra({vram_addr}),
                    .dina(12'd0),
                    .douta(vram_output[2])
    );
    txt my_txt(
        .addra({vram_addr}),
        .ascii_in(ascii_input),
        .kbsig({5'b00000, kbsig_input}),
        .clk(CLK100MHZ),
        .in_valid(kbinput_available),
        .douta(vram_output[3]),
        .available(state == 3'd3)
    );
    Calculator my_Cal(
        .addra({vram_addr}),
        .ascii_in(ascii_input),
        .kbsig({5'b00000, kbsig_input}),
        .clk(CLK100MHZ),
        .in_valid(kbinput_available),
        .douta(vram_output[4]),
        .available(state == 3'd4)
    );
endmodule

