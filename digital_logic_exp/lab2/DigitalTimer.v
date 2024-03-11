`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 13:48:41
// Design Name: 
// Module Name: DigitalTimer
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


module chose8to1_1(
        input I0,
        input I1,
        input I2,
        input I3,
        input I4,
        input I5,
        input I6,
        input I7,
        output OUT,
        input [2:0] chose_sig
    );
    assign OUT = (chose_sig == 0 & I0) |
            (chose_sig == 1 & I1) | 
            (chose_sig == 2 & I2) | 
            (chose_sig == 3 & I3) | 
            (chose_sig == 4 & I4) | 
            (chose_sig == 5 & I5) | 
            (chose_sig == 6 & I6) | 
            (chose_sig == 7 & I7);
endmodule
module chose8to1(
        input [3:0] I0,
        input [3:0] I1,
        input [3:0] I2,
        input [3:0] I3,
        input [3:0] I4,
        input [3:0] I5,
        input [3:0] I6,
        input [3:0] I7,
        output [3:0] OUT,
        input [2:0] C
    );
    genvar i;
    generate
        for(i = 0; i <= 3; i = i + 1)begin
            chose8to1_1 chose_blk(
                .I0(I0[i]),
                .I1(I1[i]),
                .I2(I2[i]),
                .I3(I3[i]),
                .I4(I4[i]),
                .I5(I5[i]),
                .I6(I6[i]),
                .I7(I7[i]),
                .OUT(OUT[3 - i]),
                .chose_sig(C)
            );
        end
    endgenerate
endmodule
// set F to blank
module decoder_seg(
                input [3:0] I,
                input point,
                output [7:0] seg
            );
    assign seg[0] = `seg_1 | `seg_4 | `seg_B | `seg_D | `seg_F;
    assign seg[1] = `seg_5 | `seg_6 | `seg_B | `seg_C | `seg_E | `seg_F;
    assign seg[2] = `seg_2 | `seg_C | `seg_E | `seg_F;
    assign seg[3] = `seg_1 | `seg_4 | `seg_7 | `seg_A | `seg_F;
    assign seg[4] = `seg_1 | `seg_3 | `seg_4 | `seg_5 | `seg_7 | `seg_9 | `seg_F;
    assign seg[5] = `seg_1 | `seg_2 | `seg_3 | `seg_7 | `seg_D | `seg_F;
    assign seg[6] = `seg_0 | `seg_1 | `seg_7 | `seg_C | `seg_F;
    assign seg[7] = point;
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

module display(
    input clk,
    input [3:0]DATA0,
    input [3:0]DATA1,
    input [3:0]DATA2,
    input [3:0]DATA3,
    input [3:0]DATA4,
    input [3:0]DATA5,
    input [3:0]DATA6,
    input [3:0]DATA7,
    input [7:0]points,
    output [7:0] SEG,
    output [7:0] choseLED
);
    wire [3:0]BUS;
    wire [2:0]choseLED_W;
    reg [2:0]c_REG;
    wire [2:0]CREG_w;
    assign CREG_w = c_REG;
    chose8to1 OUT_SUB(
        .I0(DATA0),
        .I1(DATA1),
        .I2(DATA2),
        .I3(DATA3),
        .I4(DATA4),
        .I5(DATA5),
        .I6(DATA6),
        .I7(DATA7),
        .OUT(BUS),
        .C(CREG_w)
    );
    decoder_3to8 C_LED( 
        .INPUT(3'b111 - CREG_w),
        .OUT(choseLED)
    );
    decoder_seg num2seg(
        .I(BUS),
        .point(points[3'b111 - CREG_w]),
        .seg(SEG)
    );
    reg [31:0] counter = 31'd0;
    always@(posedge clk) begin : main
        counter <= counter + 1;
        c_REG <= (counter/10000) % 8;
        if(counter == 100000000)begin
           counter <= 0;
        end
    end
endmodule

module blinker(
    input clk,
    input [7:0]blinker_addr,
    input [3:0]DATA0,
    input [3:0]DATA1,
    input [3:0]DATA2,
    input [3:0]DATA3,
    input [3:0]DATA4,
    input [3:0]DATA5,
    input [3:0]DATA6,
    input [3:0]DATA7,
    output [3:0]OUT_DATA0,
    output [3:0]OUT_DATA1,
    output [3:0]OUT_DATA2,
    output [3:0]OUT_DATA3,
    output [3:0]OUT_DATA4,
    output [3:0]OUT_DATA5,
    output [3:0]OUT_DATA6,
    output [3:0]OUT_DATA7
);
    reg [31:0]cnt = 0;
    assign OUT_DATA0 = (blinker_addr[7] == 1 && cnt > 50000000) ? 4'b1111 : DATA0;
    assign OUT_DATA1 = (blinker_addr[6] == 1 && cnt > 50000000) ? 4'b1111 : DATA1;
    assign OUT_DATA2 = (blinker_addr[5] == 1 && cnt > 50000000) ? 4'b1111 : DATA2;
    assign OUT_DATA3 = (blinker_addr[4] == 1 && cnt > 50000000) ? 4'b1111 : DATA3;
    assign OUT_DATA4 = (blinker_addr[3] == 1 && cnt > 50000000) ? 4'b1111 : DATA4;
    assign OUT_DATA5 = (blinker_addr[2] == 1 && cnt > 50000000) ? 4'b1111 : DATA5;
    assign OUT_DATA6 = (blinker_addr[1] == 1 && cnt > 50000000) ? 4'b1111 : DATA6;
    assign OUT_DATA7 = (blinker_addr[0] == 1 && cnt > 50000000) ? 4'b1111 : DATA7;
    always @(posedge clk) begin
        cnt <= (cnt + 1) % 100000000;
    end
endmodule

module trans_1224(
    input is_12,
    input [6:0]H,
    input [6:0]M,
    input [6:0]S,
    input [6:0]ms,
    output afternoon_led,
    output [3:0]DATA0,
    output [3:0]DATA1,
    output [3:0]DATA2,
    output [3:0]DATA3,
    output [3:0]DATA4,
    output [3:0]DATA5,
    output [3:0]DATA6,
    output [3:0]DATA7,
    output [7:0]points
);
    wire [6:0]H_1224;
    assign afternoon_led = (is_12 == 1'b1 && H > 12) ? 1 : 0;
    assign H_1224 = (is_12 == 1'b1 && H > 12) ? H - 12 : H;
    assign DATA0 = H_1224/10;
    assign DATA1 = H_1224%10;
    assign DATA2 = M/10;
    assign DATA3 = M%10;
    assign DATA4 = S/10;
    assign DATA5 = S%10;
    assign DATA6 = ms/10;
    assign DATA7 = ms%10;
    assign points = 8'b10101011;
endmodule

module clock(
    input clk,
    input [6:0]setting_num,
    input set,
    input [1:0]setting_mode,
    input enable,
    output [6:0]H,
    output [6:0]M,
    output [6:0]S,
    output [6:0]tms,
    output [7:0]blink_chose,
    output [2:0]TimeKeeper
);
    reg [31:0]counter;
    reg [6:0]rS = 0;
    reg [6:0]rM = 0;
    reg [6:0]rH = 0;
    reg [6:0]rTMS = 0;
    reg [7:0]blink_r;
    reg [2:0]TimeKeeper_R;
    assign TimeKeeper = TimeKeeper_R;
    assign tms = rTMS;
    assign S = rS;
    assign M = rM;
    assign H = rH;
    assign blink_chose = blink_r;
    reg is_setting = 0, has_setted = 0;
    always @(posedge clk) begin
        if(((setting_mode == 2'b00 || has_setted == 1) && is_setting == 0) || enable == 0)begin
            TimeKeeper_R = (rM == 0 && (rS == 0 || rS == 2 || rS == 4 || rS == 6 || rS == 8)) ? 4'b1111 : 4'b0000;
            if(setting_mode == 2'b00)begin
                has_setted <= 0;
            end
            if(counter == 999999)begin
                counter <= 0;
                if(rTMS == 99)begin
                    if(rS == 59)begin
                        if(rM == 59)begin
                            rH = (rH + 1) % 24;
                        end
                        rM = (rM + 1) % 60;
                    end
                    rS = (rS + 1) % 60;
                end
                rTMS <= (rTMS + 1) % 100;
            end else begin
                counter <= counter + 1;
            end
        end
        else begin
            if(has_setted == 0)begin
                is_setting <= 1;
            end
            if(set == 1)begin
                blink_r <= 8'b00000000;
                has_setted = 1;
                is_setting = 0;
            end
            if(setting_mode == 2'b01 && has_setted == 0)begin
                blink_r <= 8'b00001100;
                rS <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
            end
            if(setting_mode == 2'b10 & has_setted == 0)begin
                blink_r <= 8'b00110000;
                rM <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
            end
            if(setting_mode == 2'b11 && has_setted == 0)begin
                blink_r <= 8'b11000000;
                rH <= setting_num % 24;//(setting_num > 7'd23) ? 23 : setting_num;
            end
            if(setting_mode == 2'b00 && has_setted == 0)begin
                blink_r <= 8'b11111111;
            end
        end
    end
endmodule

module BCD2INT(
    input [3:0] data_h,//设置参数高位，使用 BCD 码表示
    input [3:0] data_l,//设置参数低位，使用 BCD 码表示
    output [6:0] data_out
);
    assign data_out = 10 * ((data_h > 9) ? 9 : data_h) + ((data_l > 9) ? 9 : data_l);
endmodule

module alarm(
    input clk,
    input [6:0]now_H,
    input [6:0]now_M,
    input [6:0]now_S,
    input [6:0]setting_num,
    input enable,
    input [1:0]AlarmNo,
    input set,
    input [1:0]setting_mode,
    output [6:0]setted_H,
    output [6:0]setted_M,
    output [6:0]setted_S,
    output [7:0]blink_chose,
    output [2:0]AlarmDisplay
);
    reg [6:0]alram_H[0:3];
    reg [6:0]alram_M[0:3];
    reg [6:0]alram_S[0:3];
    reg [2:0]alram_LED;
    reg [31:0]alram_start = 0;
    reg is_alraming, red_LED;
    reg [7:0]blink_r;
    assign blink_chose = blink_r;
    assign AlarmDisplay = alram_LED;
    assign setted_H = alram_H[AlarmNo];
    assign setted_M = alram_M[AlarmNo];
    assign setted_S = alram_S[AlarmNo];
    wire at_time;
    assign AlarmDisplay[0] = red_LED;
    assign at_time =
                 ((now_H == alram_H[0] && now_M == alram_M[0] && now_S == alram_S[0]) || 
                 (now_H == alram_H[1] && now_M == alram_M[1] && now_S == alram_S[1]) || 
                 (now_H == alram_H[2] && now_M == alram_M[2] && now_S == alram_S[2]) || 
                 (now_H == alram_H[3] && now_M == alram_M[3] && now_S == alram_S[3])  == 1 )? 1 : 0;
    reg has_setted, is_setting;
    always@(posedge clk)begin
        
        if(is_alraming == 0)begin
            is_alraming <= at_time;
            alram_start <= (at_time == 1) ? 0 : 100000000;
        end
        if(is_alraming == 1)begin
            alram_start <= alram_start + 1;
        end
        red_LED <= ((alram_start / 100000000) % 2 == 0) ? 1 : 0;
        if(alram_start >= 1000000000)begin
            is_alraming <= 0;
            alram_start <= 100000000;
            red_LED <= 0;
        end
        
        if(enable == 1)begin
            if(setting_mode == 2'b00 && has_setted == 1)begin
                has_setted <= 0;
            end
            if(setting_mode != 2'b00 && has_setted == 0)begin
                is_setting <= 1;
            end
            if(is_setting == 1)begin
                if(set == 1)begin
                    blink_r <= 8'b00000000;
                    has_setted = 1;
                    is_setting = 0;
                end
                if(setting_mode == 2'b01 && has_setted == 0)begin
                    blink_r <= 8'b00001100;
                    alram_S[AlarmNo] <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
                end
                if(setting_mode == 2'b10 & has_setted == 0)begin
                    blink_r <= 8'b00110000;
                    alram_M[AlarmNo] <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
                end
                if(setting_mode == 2'b11 && has_setted == 0)begin
                    blink_r <= 8'b11000000;
                    alram_H[AlarmNo] <= setting_num % 24;//(setting_num > 7'd23) ? 23 : setting_num;
                end
                if(setting_mode == 2'b00 && has_setted == 0)begin
                    blink_r <= 8'b11111111;
                end
            end
        end
    end
endmodule

module stopwatch(
    input srart_stop,
    input reset,
    input enable,
    input clk,
    output [6:0]H,
    output [6:0]M,
    output [6:0]S,
    output [6:0]tms,
    output [7:0]blink_chose
);
    assign blink_chose = 8'b00000000;
    reg [63:0]counter = 0;
    reg is_stop = 1;
    reg is_pushdown = 0;
    reg is_rst_pushdown = 0;
    reg [6:0]rS = 0;
    reg [6:0]rM = 0;
    reg [6:0]rH = 0;
    reg [6:0]rTMS = 0;
    assign H = rH;
    assign M = rM;
    assign S = rS;
    assign tms = rTMS;
    always@(posedge clk)begin
        if(enable == 1)begin
            if(srart_stop == 1 && is_pushdown == 0)begin
                is_stop = ~is_stop;
                is_pushdown <= 1;
            end
            if(reset == 1 && is_rst_pushdown == 0)begin
                counter <= 0;
                rTMS <= 0;
                rS <= 0;
                rM <= 0;
                rH <= 0;
                is_rst_pushdown <= 1;
            end
        end
        if(srart_stop == 0)begin
            is_pushdown <= 0;
        end
        if(reset == 0)begin
            is_rst_pushdown <= 0;
        end
        if(is_stop == 0 && !(reset == 1 && is_rst_pushdown == 0))begin
            counter <= counter + 1;//1s = 100000000
            if(counter == 999999)begin
                counter <= 0;
                if(rTMS == 99)begin
                    if(rS == 59)begin
                        if(rM == 59)begin
                            rH = (rH + 1) % 24;
                        end
                        rM = (rM + 1) % 60;
                    end
                    rS = (rS + 1) % 60;
                end
                rTMS <= (rTMS + 1) % 100;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

//a - b
module time_m(
    input [6:0]aH,
    input [6:0]aM,
    input [6:0]aS,
    input [6:0]bH,
    input [6:0]bM,
    input [6:0]bS,
    output [6:0]cH,
    output [6:0]cM,
    output [6:0]cS
);
    wire S2M, M2H;
    assign S2M = (aS >= bS) ? 0 : 1;
    assign M2H = (aM >= (bM + S2M)) ? 0 : 1;
    assign cS = (aS >= bS) ? (aS - bS) : (aS + 60 - bS);
    assign cM = (M2H) ? (aM + 60 - (bM + S2M)) : (aM - (bM + S2M));
    assign cH = aH - (bH + M2H);
endmodule

module timers(
    input clk,
    input [1:0]setting_mode,
    input [6:0]setting_num,
    input start_stop,
    input enable,
    input reset,
    input set,
    output [7:0]blink_chose,
    output [6:0]H,
    output [6:0]M,
    output [6:0]S,
    output [6:0]tms,
    output red_LED
);
    reg [6:0] max_H = 0;
    reg [6:0] max_M = 1;
    reg [6:0] max_S = 0;
    reg [6:0] rH = 0;
    reg [6:0] rM = 0;
    reg [6:0] rS = 0;
    reg [6:0] rTMS;
    reg is_setting = 0, has_setted = 0, is_running = 1, is_stop = 1;
    reg has_pushdown_stop = 0;
    reg [63:0] counter = 0;
    reg [63:0] tms_counter = 0;
    reg alram_LED = 0;
    assign red_LED = alram_LED;
    reg [7:0]blink_r;
    assign blink_chose = blink_r;
    time_m res(
        .aH(max_H),
        .aM(max_M),
        .aS(max_S),
        .bH(rH),
        .bM(rM),
        .bS(rS),
        .cH(H),
        .cM(M),
        .cS(S)
    );
    assign tms = (99 - rTMS);
    reg is_stop_pushdown = 0, is_rst_pushdown = 1;
    always@(posedge clk)begin
        if(is_running == 0)begin
            rTMS <= 99;
            rH <= 0;
            rM <= 0;
            rS <= 0;
            if(enable == 1)begin
                if(set == 1)begin
                    blink_r <= 8'b00000000;
                    has_setted <= 1;
                    is_running <= 1;
                    is_stop <= 1;
                end
                if(setting_mode == 2'b01 && has_setted == 0)begin
                    blink_r <= 8'b00001100;
                    max_S <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
                end
                if(setting_mode == 2'b10 & has_setted == 0)begin
                    blink_r <= 8'b00110000;
                    max_M <= setting_num % 60;//(setting_num > 7'd59) ? 59 : setting_num;
                end
                if(setting_mode == 2'b11 && has_setted == 0)begin
                    blink_r <= 8'b11000000;
                    max_H <= setting_num % 24;//(setting_num > 7'd23) ? 23 : setting_num;
                end
                if(setting_mode == 2'b00 && has_setted == 0)begin
                    blink_r <= 8'b11111111;
                end
            end
        end
        if(is_running == 1)begin
            blink_r <= 8'b00000000;
            if(enable == 1)begin
                if(setting_mode != 2'b00 && has_setted == 0)begin
                    is_running <= 0;
                end
                if(setting_mode != 2'b00 && has_setted == 1)begin
                    is_running <= 1;
                end
                if(setting_mode == 0)begin
                    has_setted <= 0;
                end
            end
            if(max_H == rH && max_M == rM && max_S == rS && rTMS == 99)begin
                rTMS <= 99;
                if(counter == 199999999)begin
                    counter <= 0;
                end else begin
                    counter <= counter + 1;
                end
                if(is_stop == 0)begin
                    alram_LED <= (counter / 100000000) % 2;
                end
                else begin
                    alram_LED <= 0;
                end
                if(enable == 1)begin
                    if(reset == 1 && is_rst_pushdown == 0)begin
                        counter <= 0;
                        rTMS <= 99;
                        rS <= 0;
                        rM <= 0;
                        rH <= 0;
                        is_rst_pushdown <= 1;
                        is_stop <= 1;
                    end
                    if(reset == 0)begin
                        is_rst_pushdown <= 0;
                    end
                end
            end else begin
                alram_LED <= 0;
                if(enable == 1)begin
                    if(start_stop == 1 && is_stop_pushdown == 0)begin
                        is_stop = ~is_stop;
                        is_stop_pushdown <= 1;
                    end
                    if(start_stop == 0)begin
                        is_stop_pushdown <= 0;
                    end
                    if(reset == 1 && is_rst_pushdown == 0)begin
                        counter <= 0;
                        rTMS <= 99;
                        rS <= 0;
                        rM <= 0;
                        rH <= 0;
                        is_rst_pushdown <= 1;
                    end
                    if(reset == 0)begin
                        is_rst_pushdown <= 0;
                    end
                end
                if(is_stop == 0)begin
                    counter <= counter + 1;//1s = 100000000
                    if(counter == 999999)begin
                        counter <= 0;
                        if(rTMS == 99)begin
                            if(rS == 59)begin
                                if(rM == 59)begin
                                    rH = (rH + 1) % 24;
                                end
                                rM = (rM + 1) % 60;
                            end
                            rS = (rS + 1) % 60;
                        end
                        rTMS <= (rTMS + 1) % 100;
                    end else begin
                        counter <= counter + 1;
                    end
                end
            end
        end
    end
endmodule

module DigitalTimer (
    input clk,//连接到时钟端口 CLK100MHZ，引脚 E3
    input RST,//复位按钮，单击有效
    input StartOrPause,//计时器开始或暂停，单击 1 次开始，再按 1 次暂停
    input ReadPara,//读取参数，当参数设置结束后，单击 1 次，读取数据
    input TimeFormat,//=0 表示 24 小时制，=1 表示 12 小时制
    input [1:0] mode,//功能选择，00 数字时钟，01 倒计时，10 计时器，11 设置闹钟
    input [1:0] ParaSelect,// 参数设置，00 无；01 设置秒数；10 设置分钟；11 设置小时
    input [1:0] AlarmNo,// 闹钟序号，0~3
    input [3:0] data_h,//设置参数高位，使用 BCD 码表示
    input [3:0] data_l,//设置参数低位，使用 BCD 码表示
    output Afternoon,//12 小时制时，下午时间输出为 1
    output [2:0] TimeKeeper,//整点输出 3 色指示灯
    output [2:0] AlarmDisplay,//闹钟输出 3 色指示灯
    output [7:0] segs,//七段数码管输入值，显示数字
    output [7:0] an//七段数码管控制位，控制时、分、秒
);
// Add your code
    wire [6:0] display_BUS_time_H [0:3];
    wire [6:0] display_BUS_time_M [0:3];
    wire [6:0] display_BUS_time_S [0:3]; 
    wire [6:0] display_BUS_time_tMS [0:3];
    wire [7:0]blink_BUS [0:3];
    wire [6:0]data_BUS;
    wire enable [0:3];
    assign enable[0] = (mode == 2'b00) ? 1 : 0;
    assign enable[1] = (mode == 2'b01) ? 1 : 0;
    assign enable[2] = (mode == 2'b10) ? 1 : 0;
    assign enable[3] = (mode == 2'b11) ? 1 : 0;
    BCD2INT BCD2INT0(
        .data_h(data_h),
        .data_l(data_l),
        .data_out(data_BUS)
    );

    clock clock0( 
        .clk(clk),
        .setting_num(data_BUS),
        .set(ReadPara),
        .setting_mode(ParaSelect),
        .enable(enable[0]),
        .H(display_BUS_time_H[0]),
        .M(display_BUS_time_M[0]),
        .S(display_BUS_time_S[0]),
        .tms(display_BUS_time_tMS[0]),
        .blink_chose(blink_BUS[0]),
        .TimeKeeper(TimeKeeper)
    );
    alarm alarm0(
        .clk(clk),
        .now_H(display_BUS_time_H[0]),
        .now_M(display_BUS_time_M[0]),
        .now_S(display_BUS_time_S[0]),
        .setting_num(data_BUS),
        .enable(enable[3]),
        .AlarmNo(AlarmNo),
        .set(ReadPara),
        .setting_mode(ParaSelect),
        .setted_H(display_BUS_time_H[3]),
        .setted_M(display_BUS_time_M[3]),
        .setted_S(display_BUS_time_S[3]),
        .blink_chose(blink_BUS[3]),
        .AlarmDisplay(AlarmDisplay)
    );
    stopwatch stopwatch0(
        .srart_stop(StartOrPause),
        .reset(RST),
        .enable(enable[2]),
        .clk(clk),
        .H(display_BUS_time_H[2]),
        .M(display_BUS_time_M[2]),
        .S(display_BUS_time_S[2]),
        .tms(display_BUS_time_tMS[2]),
        .blink_chose(blink_BUS[2])
    );
    timers timer0(
        .clk(clk),
        .setting_mode(ParaSelect),
        .setting_num(data_BUS),
        .start_stop(StartOrPause),
        .enable(enable[1]),
        .reset(RST),
        .set(ReadPara),
        .blink_chose(blink_BUS[1]),
        .H(display_BUS_time_H[1]),
        .M(display_BUS_time_M[1]),
        .S(display_BUS_time_S[1]),
        .tms(display_BUS_time_tMS[1]),
        .red_LED(AlarmDisplay[1])
    );

    wire [3:0]trans2blinker_0;
    wire [3:0]trans2blinker_1; 
    wire [3:0]trans2blinker_2; 
    wire [3:0]trans2blinker_3; 
    wire [3:0]trans2blinker_4;
    wire [3:0]trans2blinker_5;
    wire [3:0]trans2blinker_6;
    wire [3:0]trans2blinker_7;
    wire [7:0]trans2display_point;
    trans_1224 trans_1224_0(
        .is_12(TimeFormat),
        .H(display_BUS_time_H[mode]),
        .M(display_BUS_time_M[mode]),
        .S(display_BUS_time_S[mode]),
        .ms(display_BUS_time_tMS[mode]),
        .afternoon_led(Afternoon),
        .DATA0(trans2blinker_0),
        .DATA1(trans2blinker_1),
        .DATA2(trans2blinker_2),
        .DATA3(trans2blinker_3),
        .DATA4(trans2blinker_4),
        .DATA5(trans2blinker_5),
        .DATA6(trans2blinker_6),
        .DATA7(trans2blinker_7),
        .points(trans2display_point)
    );
    wire [3:0]blinker2display_0;
    wire [3:0]blinker2display_1; 
    wire [3:0]blinker2display_2;
    wire [3:0]blinker2display_3; 
    wire [3:0]blinker2display_4;
    wire [3:0]blinker2display_5;
    wire [3:0]blinker2display_6;
    wire [3:0]blinker2display_7;
    blinker blinker0(
        .clk(clk),
        .blinker_addr(blink_BUS[mode]),
        .DATA0(trans2blinker_0),
        .DATA1(trans2blinker_1),
        .DATA2(trans2blinker_2),
        .DATA3(trans2blinker_3),
        .DATA4(trans2blinker_4),
        .DATA5(trans2blinker_5),
        .DATA6(trans2blinker_6),
        .DATA7(trans2blinker_7),
        .OUT_DATA0(blinker2display_0),
        .OUT_DATA1(blinker2display_1),
        .OUT_DATA2(blinker2display_2),
        .OUT_DATA3(blinker2display_3),
        .OUT_DATA4(blinker2display_4),
        .OUT_DATA5(blinker2display_5),
        .OUT_DATA6(blinker2display_6),
        .OUT_DATA7(blinker2display_7)
    );
    display display0(
        .clk(clk),
        .DATA0(blinker2display_0),
        .DATA1(blinker2display_1),
        .DATA2(blinker2display_2),
        .DATA3(blinker2display_3),
        .DATA4(blinker2display_4),
        .DATA5(blinker2display_5),
        .DATA6(blinker2display_6),
        .DATA7(blinker2display_7),
        .points(trans2display_point),
        .SEG(segs),
        .choseLED(an)
        );

endmodule


