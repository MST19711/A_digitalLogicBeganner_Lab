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
    input in_valid,
    input clk,
    input [7:0] SC_in,
    input read,
    input RST,
    output [7:0] SC_out,
    output out_valid,
    output buffer_overflow
);
    reg [63:0] buffer;
    reg [7:0] dirty_bit = 0;
    reg OF = 0;
    assign buffer_overflow = OF;
    assign out_valid = dirty_bit[7];
    assign SC_out = buffer[7:0];
    always @(posedge clk) begin
        if(RST == 1)begin
            buffer <= 64'd0;
            dirty_bit <= 8'd0;
            OF <= 0;
        end else begin
            if(dirty_bit[7] == 0 || in_valid == 1 || read == 1)begin
                dirty_bit[7] <= dirty_bit[6];
                buffer[63:56] <= buffer[55:48];
                dirty_bit[6] <= dirty_bit[5];
                buffer[55:48] <= buffer[47:40];
                dirty_bit[5] <= dirty_bit[4];
                buffer[47:40] <= buffer[39:32];
                dirty_bit[4] <= dirty_bit[3];
                buffer[39:32] <= buffer[31:24];
                dirty_bit[3] <= dirty_bit[2];
                buffer[31:24] <= buffer[23:16];
                dirty_bit[2] <= dirty_bit[1];
                buffer[23:16] <= buffer[15:8];
                dirty_bit[1] <= dirty_bit[0];
                buffer[15:8] <= buffer[7:0];
                dirty_bit[0] <= in_valid;
            end
            if(in_valid == 1)begin
                buffer[7:0] <= SC_in;
            end
            if(read == 0 && dirty_bit[7] == 1 && in_valid == 1)begin
                OF <= 1;
            end else begin
                OF <= 0;
            end
        end
    end
endmodule

module display_kbdata(
    input [7:0] SC_in,
    inout buffer_outvalid,
    input HALT,
    input clk,
    output read,
    output [6:0]SEG,
    output [7:0]AN,
    output [15:1] LED   //显示
);
    reg [31:0] counter = 0;
    reg [7:0] last_SC = 0;
    reg [7:0] this_SC = 0;
    reg [7:0] ascii_pushdown = 0;
    reg CapsLock = 0, NumLock = 0, Shift = 0, Ctrl = 0, Alt = 0;
    assign LED[1] = CapsLock;
    assign LED[2] = NumLock;
    assign LED[3] = Shift;
    assign LED[4] = Ctrl;
    assign LED[5] = Alt;
    assign LED[15:6] = 10'd0;
    reg has_read;
    assign read = has_read;
    reg [7:0] now_ascii = 0;
    wire [7:0] ascii_temp;
    reg [7:0] now_down = 0;
    wire [7:0]kbC;
    assign kbC = now_down;
    reg next_up = 0;
    kbcode2ascii k2a_0(
        .asciicode(ascii_temp),
        .kbcode(kbC)
    );
    seg7decimal sevenSeg (
        .x({counter[7:0], last_SC, this_SC, now_ascii}),
        .clk(clk),
        .seg(SEG[6:0]),
        .an(AN[7:0])
    );
    always @(posedge clk) begin
        if(buffer_outvalid == 1)begin
            last_SC <= this_SC;
            this_SC <= SC_in;
            has_read <= 1;
            if(SC_in != 8'hF0)begin
                if(next_up == 1)begin
                    now_down <= 0;
                    if(SC_in == 8'h12)   Shift <= 0;
                    if(SC_in == 8'h59)   Shift <= 0;
                    if(SC_in == 8'h14)   Ctrl <= 0;
                    if(SC_in == 8'h11)   Alt <= 0;
                end else begin
                    now_down <= SC_in;
                    if(SC_in == 8'h58)   CapsLock <= ~CapsLock;
                    if(SC_in == 8'h77)   NumLock <= ~NumLock;
                    if(SC_in == 8'h12)   Shift <= 1;
                    if(SC_in == 8'h59)   Shift <= 1;
                    if(SC_in == 8'h14)   Ctrl <= 1;
                    if(SC_in == 8'h11)   Alt <= 1;
                    if(CapsLock ^ Shift == 1)begin
                        /*
                        python3
                            for i in list(string.ascii_lowercase):
                                print("if(ascii_temp == 8'd{})  now_ascii <= 8'd{};".format(str(ord(i)), str(ord(i) + ord('A') - ord('a'))))
                        */
                        if(ascii_temp == 8'd97)  now_ascii <= 8'd65;
                        if(ascii_temp == 8'd98)  now_ascii <= 8'd66;
                        if(ascii_temp == 8'd99)  now_ascii <= 8'd67;
                        if(ascii_temp == 8'd100)  now_ascii <= 8'd68;
                        if(ascii_temp == 8'd101)  now_ascii <= 8'd69;
                        if(ascii_temp == 8'd102)  now_ascii <= 8'd70;
                        if(ascii_temp == 8'd103)  now_ascii <= 8'd71;
                        if(ascii_temp == 8'd104)  now_ascii <= 8'd72;
                        if(ascii_temp == 8'd105)  now_ascii <= 8'd73;
                        if(ascii_temp == 8'd106)  now_ascii <= 8'd74;
                        if(ascii_temp == 8'd107)  now_ascii <= 8'd75;
                        if(ascii_temp == 8'd108)  now_ascii <= 8'd76;
                        if(ascii_temp == 8'd109)  now_ascii <= 8'd77;
                        if(ascii_temp == 8'd110)  now_ascii <= 8'd78;
                        if(ascii_temp == 8'd111)  now_ascii <= 8'd79;
                        if(ascii_temp == 8'd112)  now_ascii <= 8'd80;
                        if(ascii_temp == 8'd113)  now_ascii <= 8'd81;
                        if(ascii_temp == 8'd114)  now_ascii <= 8'd82;
                        if(ascii_temp == 8'd115)  now_ascii <= 8'd83;
                        if(ascii_temp == 8'd116)  now_ascii <= 8'd84;
                        if(ascii_temp == 8'd117)  now_ascii <= 8'd85;
                        if(ascii_temp == 8'd118)  now_ascii <= 8'd86;
                        if(ascii_temp == 8'd119)  now_ascii <= 8'd87;
                        if(ascii_temp == 8'd120)  now_ascii <= 8'd88;
                        if(ascii_temp == 8'd121)  now_ascii <= 8'd89;
                        if(ascii_temp == 8'd122)  now_ascii <= 8'd90;
                        else now_ascii <= ascii_temp;
                    end else begin
                        now_ascii <= ascii_temp;
                    end
                end
                counter <= counter + 1;
                next_up <= 0;
            end else begin
                now_ascii <= 0;
                next_up <= 1;
            end
        end else begin
            has_read <= 0;
        end
    end
endmodule

module KeyboardSim(
    input CLK100MHZ,   //系统时钟信号
    input PS2_CLK,    //来自键盘的时钟信号
    input PS2_DATA,  //来自键盘的串行数据位
    input BTNC,      //Reset
    output [6:0]SEG,
    output [7:0]AN,
    output [15:0] LED   //显示
    );
    
// Add your code here
    wire [31:0] keycodeout;
    wire ready;
    reg CapsLock, Shift;
    reg [31:0] counter = 32'd0;
    reg has_ready = 0;
    reg [0:255] has_pushdown;
    KeyBoardReceiver keyboard_0(
        .keycodeout(keycodeout),           //接收到连续4个键盘扫描码
        .ready(ready),                     //数据就绪标志位
        .clk(CLK100MHZ),                        //系统时钟 
        .kb_clk(PS2_CLK),                    //键盘 时钟信号
        .kb_data(PS2_DATA)                    //键盘 串行数据
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
    buffer B_0(
        .in_valid(buffer_inv_w),
        .clk(clk),
        .SC_in(buffer_SC_in_w),
        .read(read_sig),
        .RST(BTNC),
        .SC_out(buffer2dis),
        .out_valid(buf_out_val),
        .buffer_overflow(LED[0])
    );
    display_kbdata dis_0(
        .SC_in(buffer2dis),
        .buffer_outvalid(buf_out_val),
        .HALT(1'b0),
        .clk(clk),
        .read(read_sig),
        .SEG(SEG),
        .AN(AN),
        .LED(LED[15:1])   //显示
    );
    always @(posedge clk) begin
        if(ready == 1 && has_ready == 0)begin
            has_ready <= 1;
            if(keycodeout[7:0] == 8'hF0)begin
                ready_to_up <= 1;
                buffer_inv <= 1;
                buffer_SC_in <= 8'hF0;
            end else begin
                if(ready_to_up == 1)begin
                    ready_to_up <= 0;
                    has_pushdown[keycodeout[7:0]] <= 0;
                    buffer_inv <= 1;
                    buffer_SC_in <= keycodeout[7:0];
                end else begin
                    if(has_pushdown[keycodeout[7:0]] == 0)begin
                        has_pushdown[keycodeout[7:0]] <= 1;
                        buffer_inv <= 1;
                        buffer_SC_in <= keycodeout[7:0];
                    end
                end
            end
        end else begin
            has_ready <= 0;
            buffer_inv <= 0;
        end
    end
endmodule
