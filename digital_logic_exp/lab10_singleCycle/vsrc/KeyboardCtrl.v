`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/10 09:38:14
// Design Name: 
// Module Name: KeyboardSim
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

module KeyboardCtrl(
    input CLK100MHZ,   //ϵͳʱ���ź�
    input PS2_CLK,    //���Լ��̵�ʱ���ź�
    input PS2_DATA,  //���Լ��̵Ĵ�������λ
    input BTNC,      //Reset
    input [31:0] memmap_addr,
    output [31:0] memmap_output
);
    wire [31:0] keycode;
    wire ready;
    reg CLK50MHZ=0;    
    always @(posedge(CLK100MHZ))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    KeyBoardReceiver keyboard_0(
        .keycodeout(keycode),           //���յ�����4������ɨ����
        .ready(ready),                     //���ݾ�����־λ
        .clk(CLK50MHZ),                        //ϵͳʱ�� 
        .kb_clk(PS2_CLK),                    //���� ʱ���ź�
        .kb_data(PS2_DATA)                    //���� ��������
    );
    reg [31:0] snapshot;
    reg kbcode_on [2**8 - 1 : 0];
    assign memmap_output = (kbcode_on[memmap_addr[7:0]] == 1) ? 32'hffffffff : 32'h0;
    always @(posedge CLK100MHZ) begin//我们相信ps2时钟足够慢
        if(snapshot != keycode) begin
            snapshot <= keycode;
            if(keycode[15:8] == 8'hf0) begin
                kbcode_on[keycode[7:0]] <= 1'b0;
                // $display("0x%h lift", keycode[7:0]);
            end else if(keycode[7:0] != 8'hf0) begin
                kbcode_on[keycode[7:0]] <= 1'b1;
                // $display("0x%h on", keycode[7:0]);
            end
        end
    end
endmodule