`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/13 10:56:11
// Design Name: 
// Module Name: KeyBoardReceiver
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

module KeyBoardReceiver(
        output [31:0] keycodeout,           //接收到连续4个键盘扫描码
        output ready,                     //数据就绪标志位
        input clk,                        //系统时钟 
        input kb_clk,                    //键盘 时钟信号
        input kb_data                    //键盘 串行数据
    );
    wire kclkf, kdataf;
    reg [7:0]datacur;              //当前扫描码
    reg [7:0]dataprev;            //上一个扫描码
    reg [3:0]cnt;                //收到串行位数
    reg [31:0]keycode;            //扫描码
    reg flag;                     //接受1帧数据
    reg readyflag = 0;
//    reg error;                   //错误标志位
    initial begin                 //初始化
        keycode[7:0] = 8'b00000000;
        cnt = 4'b0000;
    end
    debouncer debounce( .clk(clk), .I0(kb_clk), .I1(kb_data), .O0(kclkf), .O1(kdataf));  //消除按键抖动
    always@(negedge(kclkf))begin
     case(cnt)
            0:  ;//readyflag<=1'b0;                       //开始位
            1:begin datacur[0]<=kdataf; end
            2:datacur[1]<=kdataf;
            3:datacur[2]<=kdataf;
            4:datacur[3]<=kdataf;
            5:datacur[4]<=kdataf;
            6:datacur[5]<=kdataf;
            7:datacur[6]<=kdataf;
            8:datacur[7]<=kdataf;
            9:flag<=1'b1;         //已接收8位有效数据
            10:flag<=1'b0;       //结束位
          endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10)  cnt<=0;
    end
    reg [3:0]last_up = 0;
    always @(posedge flag)begin
        if (dataprev!=datacur | last_up != 0)begin           //去除重复按键数据
            if(last_up != 0 && datacur != 8'hF0)    last_up <= last_up - 1;
            keycode[31:24]<=keycode[23:16];
            keycode[23:16]<=keycode[15:8];
            keycode[15:8]<=dataprev;
            keycode[7:0]<=datacur;
            dataprev<=datacur;
            readyflag<=1'b1;              //数据就绪标志位置1
            if(datacur == 8'hF0)begin
                last_up <= 2;
            end 
        end else begin
             readyflag <= 1'b0;
        end
    end
    assign keycodeout = keycode;
    assign ready = readyflag; //readyflag;    
endmodule

module debouncer(
    input clk,
    input I0,
    input I1,
    output reg O0,
    output reg O1
    );
    reg [4:0]cnt0, cnt1;
    reg Iv0=0,Iv1=0;
    reg out0, out1;
    always@(posedge(clk))begin
    if (I0==Iv0)begin
        if (cnt0==19) O0<=I0;   //接收到20次相同数据
        else cnt0<=cnt0+1;
      end
    else begin
        cnt0<=5'b00000;
        Iv0<=I0;
    end
    if (I1==Iv1)begin
            if (cnt1==19) O1<=I1;  //接收到20次相同数据
            else cnt1<=cnt1+1;
          end
        else begin
            cnt1<=5'b00000;
            Iv1<=I1;
        end
    end
endmodule
