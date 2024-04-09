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
    inout PS2_CLK,
    inout PS2_DATA,
    output [4:0]LED,
    output ps2clk_out
    );
 // add your code here
    reg hassend_st = 0;
    reg [15:0]state = 0;//wait : 0, get control of ps2clk : 1, send ack : 2
    reg [31:0]cnt = 0;
    reg [7:0]dataframe;
    reg checksum = 0;
    reg readyflag = 0;
    reg has_ready = 0;
    reg [31:0] test = 0;
    reg last_PS2CLK = 0;
    reg [31:0] time_after_last_ps2clk = 0;
    reg [31:0] ps2clk_counter = 0;
    reg ps2_writting = 0;
    always@(negedge(PS2_CLK))begin
        if(ps2_writting == 0)begin
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
        end else begin
            cnt <= 0;
            dataframe <= 8'b0;
        end
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
    reg [31:0] ps2clk_ounter = 0;
    always@(negedge(PS2_CLK))begin
        if(ps2clk_ounter < 100000000) ps2clk_ounter <= ps2clk_ounter + 1;
        else ps2clk_ounter <= 0;
    end
    assign ps2clk_out = hassend_st;//(ps2clk_ounter > 50000000) ? 1'b1 : 1'b0; 
    reg PS2_CLK_R = 1'bz, PS2_DATA_R = 1'bz;
    reg [31:0] sent_counter = 0;
    reg wait_to_next_ps2clk = 0;
    assign PS2_CLK = PS2_CLK_R;
    assign PS2_DATA = PS2_DATA_R;
    reg [4:0] LEDR;
    assign LED = LEDR;
    reg [31:0] sender_counter = 0;
    reg prev_ps2clk;
    reg [31:0] sentsig_couunter = 0;
    reg [31:0] synsig_counter = 0;
    reg prev_ps2clk_posedge = 0;
    always @(posedge CLK100MHZ) begin 
        prev_ps2clk <= PS2_CLK;
        if(prev_ps2clk != PS2_CLK)begin
            time_after_last_ps2clk <= 0;
        end else begin
            if(time_after_last_ps2clk < 100000000)begin
                time_after_last_ps2clk <= time_after_last_ps2clk + 1;
            end else begin
                state <= 0;
                PS2_CLK_R <= 1'bz;
                PS2_DATA_R <= 1'bz;
            end
        end
        if(state == 0) begin
            LEDR = 5'b10000;
            if(time_after_last_ps2clk == 0)begin
                state <= 1;
                PS2_CLK_R <= 1'bz;
                PS2_DATA_R <= 1'bz;
                sentsig_couunter <= 0;
                ps2_writting <= 1'b1;
            end
        end
        if(state == 1) begin
            LEDR = 5'b01000;
            if(sentsig_couunter < 10000)begin
                sentsig_couunter <= sentsig_couunter + 1;
                PS2_CLK_R <= 1'b0;
            end else begin
                PS2_CLK_R <= 1'bz;
                sentsig_couunter <= 0;
                synsig_counter <= 0;
                prev_ps2clk_posedge <= 0;
                state <= 2;
            end
        end
        if(state == 2) begin
            LEDR = 5'b00100;
            if(prev_ps2clk == 0 && PS2_CLK == 1 && prev_ps2clk_posedge == 0)begin
                prev_ps2clk_posedge <= 1;
            end
            if(prev_ps2clk == 1 && PS2_CLK == 0 && prev_ps2clk_posedge == 1)begin
                synsig_counter <= synsig_counter + 1;
                prev_ps2clk_posedge <= 0;
            end
            case(synsig_counter)
                0:  PS2_DATA_R <= 1'b0;                       //开始位
                1:  PS2_DATA_R <= 1'b0;
                2:  PS2_DATA_R <= 1'b0;  
                3:  PS2_DATA_R <= 1'b1;  
                4:  PS2_DATA_R <= 1'b0;  
                5:  PS2_DATA_R <= 1'b1;  
                6:  PS2_DATA_R <= 1'b1;  
                7:  PS2_DATA_R <= 1'b1;  
                8:  PS2_DATA_R <= 1'b1;   
                9:  PS2_DATA_R <= 1'b1;          //已send8位有效数据
                10: PS2_DATA_R <= 1'b1;        //结束位
                11: begin
                        PS2_DATA_R <= 1'bz;
                        ps2_writting <= 1'b0;
                        state <= 3;
                    end
            endcase
        end
        if(state == 3) begin
            LEDR = 5'b00010;
            has_ready <= readyflag;
            if(readyflag == 1 && has_ready == 0)begin
                if(dataframe == 8'hFA)begin
                    PS2_CLK_R <= 1'bz;
                    PS2_DATA_R <= 1'bz;
                    mouse_counter <= 0;
                    ps2_writting <= 1'b0;
                    state <= 4;
                end
            end
        end
        if(state == 4) begin
            LEDR = 5'b00001;
            has_ready <= readyflag;
            if(has_ready == 0 && readyflag == 1)begin
                mouse_counter <= (mouse_counter == 3) ? 0 : mouse_counter + 1;
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
            end 
        end
    end
endmodule
