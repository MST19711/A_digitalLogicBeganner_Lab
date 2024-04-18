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
module buffer(
    input [31:0]SC_in,
    input read,
    input clk,
    input rst,
    output [7:0]SC_out,
    output OF,
    output out_valid
);
    reg [31:0]head = 0, tail = 0;
    reg [31:0]snapshot;
    reg [7:0]buffer[7:0];
    assign SC_out = buffer[tail];
    assign out_valid = (tail != head);
    reg OF_r = 0;
    assign OF = OF_r;
    always@(posedge clk)begin
        if(rst == 1)begin
            head <= 32'd0;
            tail <= 32'd0;
            OF_r <= 0;
        end else begin
            if(snapshot != SC_in)begin
                snapshot <= SC_in;
                buffer[head] <= SC_in[7:0];
                head <= (head + 1) % 8;
                if((head + 1) % 8 == tail)begin
                    OF_r <= 1;
                end
                else begin 
                    OF_r <= 0;
                end
            end
            if(read == 1)begin
                tail <= (tail + 1) % 8;
            end
        end
     end
endmodule

module KeyboardSim(
    input CLK100MHZ,   //ϵͳʱ���ź�
    input PS2_CLK,    //���Լ��̵�ʱ���ź�
    input PS2_DATA,  //���Լ��̵Ĵ�������λ
    input BTNC,      //Reset
    output [6:0]SEG,
    output [7:0]AN,
    output [15:0] LED,   //��ʾ
    output testLED
    );
    
// Add your code here
    wire [31:0] keycode;
    wire ready;
    reg [31:0] counter = 32'd0;
    reg has_ready = 0;
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
    wire [7:0]buffer_read;
    wire buffer_outval;
    buffer BUF_0(
        .SC_in(keycode),
        .read(0),
        .clk(CLK100MHZ),
        .rst(BTNC),
        .SC_out(buffer_read),
        .OF(LED[0]),
        .out_valid(buffer_outval)
    );
    reg ready_to_up = 0;
    reg buffer_inv;
    wire buffer_inv_w;
    assign buffer_inv_w = buffer_inv;
    reg [7:0] buffer_SC_in;
    wire [7:0] buffer_SC_in_w;
    assign buffer_SC_in_w = buffer_SC_in;
    wire read_sig, buf_out_val;
    wire [7:0] buffer2dis;
    reg testout = 0;
    assign testLED = BTNC;
    reg [7:0] now_ascii;
    wire [7:0]Nascii_w;
    assign Nascii_w = now_ascii;
    wire [7:0]ascii_temp;
    reg CapsLock = 0, NumLock = 0, Shift = 0, Ctrl = 0, Alt = 0;
    reg [7:0] last_SC, this_SC;
    kbcode2ascii k2a_0(
        .asciicode(ascii_temp),
        .kbcode(this_SC)
    );
    assign LED[1] = CapsLock;
    assign LED[2] = NumLock;
    assign LED[3] = Shift;
    assign LED[4] = Ctrl;
    assign LED[5] = Alt;
    wire DP;
    seg7decimal sevenSeg (.x({counter[7:0], last_SC, this_SC, Nascii_w}),.clk(CLK100MHZ),.seg(SEG[6:0]),.an(AN[7:0]),.dp(DP) );
    //{counter[7:0], last_SC, this_SC, Nascii_w}
    
    reg [31:0] snapshot = 0;
    always @(posedge CLK100MHZ) begin
        if(snapshot != keycode)begin
            snapshot <= keycode;
            if(keycode[15:8] != 8'hf0)begin
                    if(keycode[7:0] == 8'h58)   CapsLock <= ~CapsLock;
                    if(keycode[7:0] == 8'h77)   NumLock <= ~NumLock;
                    if(keycode[7:0] == 8'h12)   Shift <= 1;
                    if(keycode[7:0] == 8'h59)   Shift <= 1;
                    if(keycode[7:0] == 8'h14)   Ctrl <= 1;
                    if(keycode[7:0] == 8'h11)   Alt <= 1;
                    if(keycode[7:0] != 8'hf0)begin
                        last_SC <= this_SC;
                        this_SC <= keycode[7:0];
                    end
                    counter <= counter + 1;
            end else begin
                if(keycode[7:0] == 8'h12)   Shift <= 0;
                if(keycode[7:0] == 8'h59)   Shift <= 0;
                if(keycode[7:0] == 8'h14)   Ctrl <= 0;
                if(keycode[7:0] == 8'h11)   Alt <= 0;
                counter <= counter - 1;
            end
        end
        if(CapsLock ^ Shift == 1)begin
            testout <= 1;
            /*
            python3
                 for i in list(string.ascii_lowercase):
                     print("else if(ascii_temp == 8'd{})  now_ascii <= 8'd{};".format(str(ord(i)), str(ord(i) + ord('A') - ord('a'))))
            */
                if(ascii_temp == 8'h61)  now_ascii <= 8'd65;
                else if(ascii_temp == 8'd98)  now_ascii <= 8'd66;
                       else if(ascii_temp == 8'd99)  now_ascii <= 8'd67;
                       else if(ascii_temp == 8'd100)  now_ascii <= 8'd68;
                       else if(ascii_temp == 8'd101)  now_ascii <= 8'd69;
                       else if(ascii_temp == 8'd102)  now_ascii <= 8'd70;
                       else if(ascii_temp == 8'd103)  now_ascii <= 8'd71;
                       else if(ascii_temp == 8'd104)  now_ascii <= 8'd72;
                       else if(ascii_temp == 8'd105)  now_ascii <= 8'd73;
                       else if(ascii_temp == 8'd106)  now_ascii <= 8'd74;
                       else if(ascii_temp == 8'd107)  now_ascii <= 8'd75;
                       else if(ascii_temp == 8'd108)  now_ascii <= 8'd76;
                       else if(ascii_temp == 8'd109)  now_ascii <= 8'd77;
                       else if(ascii_temp == 8'd110)  now_ascii <= 8'd78;
                       else if(ascii_temp == 8'd111)  now_ascii <= 8'd79;
                       else if(ascii_temp == 8'd112)  now_ascii <= 8'd80;
                       else if(ascii_temp == 8'd113)  now_ascii <= 8'd81;
                       else if(ascii_temp == 8'd114)  now_ascii <= 8'd82;
                       else if(ascii_temp == 8'd115)  now_ascii <= 8'd83;
                       else if(ascii_temp == 8'd116)  now_ascii <= 8'd84;
                       else if(ascii_temp == 8'd117)  now_ascii <= 8'd85;
                       else if(ascii_temp == 8'd118)  now_ascii <= 8'd86;
                       else if(ascii_temp == 8'd119)  now_ascii <= 8'd87;
                       else if(ascii_temp == 8'd120)  now_ascii <= 8'd88;
                       else if(ascii_temp == 8'd121)  now_ascii <= 8'd89;
                       else if(ascii_temp == 8'd122)  now_ascii <= 8'd90;
                       else now_ascii <= ascii_temp;
            end else begin
                now_ascii <= ascii_temp;
                testout <= 0;
            end
    end
endmodule
