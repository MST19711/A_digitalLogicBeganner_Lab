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
    output [7:0]blink_chose
);
    reg [31:0]counter;
    reg [6:0]rS = 0;
    reg [6:0]rM = 0;
    reg [6:0]rH = 0;
    reg [6:0]rTMS = 0;
    reg [7:0]blink_r;
    assign tms = rTMS;
    assign S = rS;
    assign M = rM;
    assign H = rH;
    assign blink_chose = blink_r;
    reg is_setting = 0, has_setted = 0;
    always @(posedge clk) begin
        if(((setting_mode == 2'b00 || has_setted == 1) && is_setting == 0) || enable == 0)begin
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
        .blink_chose(blink_BUS[0])
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


