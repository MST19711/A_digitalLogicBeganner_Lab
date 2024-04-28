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

module KeyboardSim(
    input CLK100MHZ,   //ϵͳʱ���ź�
    input PS2_CLK,    //���Լ��̵�ʱ���ź�
    input PS2_DATA,  //���Լ��̵Ĵ�������λ
    input BTNC,      //Reset
    output [7:0] ascii_out,
    output [10:0] kb_sig,// 10:esc, 9:backspace, 8:u, 7:d, 6:l, 5:r
    output ascii_available
    );
    
// Add your code here
    wire [31:0] keycode;
    wire ready;
    reg [31:0] counter = 32'd0;
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
    
    reg testout = 0;
    reg [7:0] now_ascii;
    wire [7:0] Nascii_w;
    assign Nascii_w = now_ascii;
    assign ascii_out = now_ascii;
    wire [7:0]ascii_temp;
    // verilator lint_off INITIALDLY
    reg CapsLock = 0, NumLock = 0, Shift = 0, Ctrl = 0, Alt = 0;
    reg uR = 0, dR = 0, lR = 0, rR = 0;
    reg bsR = 0, escR = 0;
    // verilator lint_on INITIALDLY
    reg [7:0] last_SC, this_SC;
    kbcode2ascii k2a_0(
        .asciicode(ascii_temp),
        .kbcode(this_SC)
    );
    assign kb_sig[0] = CapsLock;
    assign kb_sig[1] = NumLock;
    assign kb_sig[2] = Shift;
    assign kb_sig[3] = Ctrl;
    assign kb_sig[4] = Alt;
    assign kb_sig[5] = rR;
    assign kb_sig[6] = lR;
    assign kb_sig[7] = dR;
    assign kb_sig[8] = uR;
    assign kb_sig[9] = bsR;
    assign kb_sig[10] = escR;
    // seg7decimal sevenSeg (.x({counter[7:0], last_SC, this_SC, Nascii_w}),.clk(CLK100MHZ),.seg(SEG[6:0]),.an(AN[7:0]),.dp(DP) );
    //{counter[7:0], last_SC, this_SC, Nascii_w}
    reg ascii_available_R = 0;
    assign ascii_available = ascii_available_R;
    reg [31:0] snapshot = 0;
    reg next_available = 0;
    always @(posedge CLK100MHZ) begin
        if(uR == 1)begin
            uR <= 0;
        end
        if(dR == 1)begin
            dR <= 0;
        end
        if(lR == 1)begin
            lR <= 0;
        end
        if(rR == 1)begin
            rR <= 0;
        end
        if(bsR == 1)begin
            bsR <= 0;
        end
        if(escR == 1)begin
            escR <= 0;
        end

        if(next_available == 1)begin
            ascii_available_R <= 1;
            next_available <= 0;
        end else begin
            ascii_available_R <= 0;
            next_available <= 0;
        end
        if(snapshot != keycode)begin
            snapshot <= keycode;
            if(keycode[15:0] == 16'hE075)begin
                uR <= 1;
            end
            if(keycode[15:0] == 16'hE072)begin
                dR <= 1;
            end
            if(keycode[15:0] == 16'hE06B)begin
                rR <= 1;
            end
            if(keycode[15:0] == 16'hE074)begin
                lR <= 1;
            end
            if(keycode[15:8] != 8'hf0)begin        
                    if(keycode[7:0] == 8'h58)   CapsLock <= ~CapsLock;
                    else if(keycode[7:0] == 8'h77)   NumLock <= ~NumLock;
                    else if(keycode[7:0] == 8'h12)   Shift <= 1;
                    else if(keycode[7:0] == 8'h59)   Shift <= 1;
                    else if(keycode[7:0] == 8'h14)   Ctrl <= 1;
                    else if(keycode[7:0] == 8'h11)   Alt <= 1;
                    else if(keycode[7:0] == 8'h66)   bsR <= 1;
                    else if(keycode[7:0] == 8'h76)   escR <= 1;
                    else if((keycode[7:0] != 8'hf0) & (keycode[15:8] != 8'hE0) & (keycode[7:0] != 8'hE0))begin
                        next_available <= 1;
                        //$display("receive %x", keycode[7:0]);
                    end
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
                if(keycode[7:0] == 8'h66)   bsR <= 0;
                if(keycode[7:0] == 8'h76)   escR <= 1;
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
                       else if(ascii_temp == 8'd61)  now_ascii <= 8'd43;
                       else if(ascii_temp == 8'd45)  now_ascii <= 8'd95;
                       else if(ascii_temp == 8'd48)  now_ascii <= 8'd41;
                       else if(ascii_temp == 8'd57)  now_ascii <= 8'd40;
                       else if(ascii_temp == 8'd56)  now_ascii <= 8'd42;
                       else now_ascii <= ascii_temp;
            end else begin
                now_ascii <= ascii_temp;
                testout <= 0;
            end
    end
endmodule
