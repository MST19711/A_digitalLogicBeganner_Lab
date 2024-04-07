`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/13 23:05:31
// Design Name: 
// Module Name: MouseReceiver
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


module MouseReceiver(
    output [6:0]SEG,
    output [7:0]AN,
    output DP,
    output LeftButton,     //左侧按钮状态
    output MiddleButton,   //中间按钮状态
    output RightButton,     //右侧按钮状态
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA
    );
 // add your code here
    reg [31:0]cnt = 0;
    reg [7:0]dataframe;
    reg checksum = 0;
    reg readyflag = 0;
    reg has_ready = 0;
    always@(negedge(PS2_CLK))begin
        case(cnt)
            0:  readyflag<=1'b0;                       //开始位
            1:dataframe[0]<=PS2_DATA;
            2:dataframe[1]<=PS2_DATA;
            3:dataframe[2]<=PS2_DATA;
            4:dataframe[3]<=PS2_DATA;
            5:dataframe[4]<=PS2_DATA;
            6:dataframe[5]<=PS2_DATA;
            7:dataframe[6]<=PS2_DATA;
            8:dataframe[7]<=PS2_DATA;
            9:checksum<=PS2_DATA;         //已接收8位有效数据
            10:readyflag<=1'b1;       //结束位
        endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10)  cnt<=0;
    end
    reg [3:0] mouse_counter = 0;
    reg YOVF, XOVF, YSIGN, XSIGN, MBTN, RBTN, LBTN, empty;
    reg [7:0]dx = 0, dy = 0, dz = 0;
    wire [11:0]dis_x, dis_y;
    wire [7:0]dis_z;
    assign dis_x = {4'd000, XSIGN, dx};
    assign dis_y = {4'd000, YSIGN, dy};
    assign dis_z = dz;
    assign LeftButton = LBTN;
    assign RightButton = RBTN;
    assign MiddleButton = MBTN;
    seg7decimal seg_0(
        .x({dis_x, dis_y, dis_z}),
        .clk(CLK100MHZ),
        .seg(SEG),
        .an(AN)
    );
    always @(posedge CLK100MHZ) begin
        if(has_ready == 0 && readyflag == 1)begin
            mouse_counter <= (mouse_counter == 3) ? 0 : mouse_counter + 1;
            has_ready <= 1;
            if(mouse_counter == 4'd0)begin
                {YOVF, XOVF, YSIGN, XSIGN, empty, MBTN, RBTN, LBTN} <= dataframe;
            end
            if(mouse_counter == 4'd1)begin
                dx <= dataframe;
            end
            if(mouse_counter == 4'd2)begin
                dy <= dataframe;
            end
            if(mouse_counter == 4'd3)begin
                dz <= dataframe;
            end
        end else begin
            has_ready <= 0;
        end
    end
endmodule
