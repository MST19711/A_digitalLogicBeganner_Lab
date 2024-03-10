`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 16:33:34
// Design Name: 
// Module Name: encryption6b
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


module encryption6b(
    output [7:0] dataout,    //输出加密或解密后的8比特ASCII数据。
    output reg ready,       //输出有效标识，高电平说明输出有效，第6周期高电平
    output [5:0] key,       //输出6位加密码
    input clk,             // 时钟信号，上升沿有效
    input load,            //载入seed指示，高电平有效
    input [7:0] datain       //输入数据的8比特ASCII码。
);
    wire  [63:0] seed=64'ha845fd7183ad75c4;       //初始64比特seed=64'ha845fd7183ad75c4
//add your code here
    reg [7:0]datain_R;
    wire [63:0]lfsr_out;
    reg [2:0] counter = 3'b000;
    lfsr L(
        .dout(lfsr_out),
        .seed(seed),
        .clk(clk),
        .load(load)
    );
    assign key = lfsr_out[63:58];
    assign dataout[7] = datain_R[7]; 
    assign dataout[6] = datain_R[6]; 
    assign dataout[5] = datain_R[5] ^ lfsr_out[63]; 
    assign dataout[4] = datain_R[4] ^ lfsr_out[62]; 
    assign dataout[3] = datain_R[3] ^ lfsr_out[61]; 
    assign dataout[2] = datain_R[2] ^ lfsr_out[60]; 
    assign dataout[1] = datain_R[1] ^ lfsr_out[59]; 
    assign dataout[0] = datain_R[0] ^ lfsr_out[58]; 
    always @(posedge clk) begin
        if(load == 1)begin
            datain_R <= datain;
            counter <= 6'b000;
            ready <= 1'b0;
        end else begin
            if(counter == 3'b101)begin
                counter <= 3'b000;
                ready <= 1'b1;
            end else begin
                counter <= counter + 1;
                ready <= 1'b0;
            end
        end
    end
endmodule

module lfsr(              //64位线性移位寄存器
	output reg [63:0] dout,
    input  [63:0]  seed,
	input  clk,
	input  load
	);
    reg new_bit;
    always @(posedge clk) begin
        if(load == 1)begin
            dout <= seed;
        end
        else begin
            new_bit <= dout[0] ^ dout[1] ^ dout[2] ^ dout[3];
            /*
            ```python3
            for i in range(0, 63):
                print("dout[{}] <= dout[{}];".format(str(i), str(i+1)))
            ```
            */
            dout[0] <= dout[1];
            dout[1] <= dout[2];
            dout[2] <= dout[3];
            dout[3] <= dout[4];
            dout[4] <= dout[5];
            dout[5] <= dout[6];
            dout[6] <= dout[7];
            dout[7] <= dout[8];
            dout[8] <= dout[9];
            dout[9] <= dout[10];
            dout[10] <= dout[11];
            dout[11] <= dout[12];
            dout[12] <= dout[13];
            dout[13] <= dout[14];
            dout[14] <= dout[15];
            dout[15] <= dout[16];
            dout[16] <= dout[17];
            dout[17] <= dout[18];
            dout[18] <= dout[19];
            dout[19] <= dout[20];
            dout[20] <= dout[21];
            dout[21] <= dout[22];
            dout[22] <= dout[23];
            dout[23] <= dout[24];
            dout[24] <= dout[25];
            dout[25] <= dout[26];
            dout[26] <= dout[27];
            dout[27] <= dout[28];
            dout[28] <= dout[29];
            dout[29] <= dout[30];
            dout[30] <= dout[31];
            dout[31] <= dout[32];
            dout[32] <= dout[33];
            dout[33] <= dout[34];
            dout[34] <= dout[35];
            dout[35] <= dout[36];
            dout[36] <= dout[37];
            dout[37] <= dout[38];
            dout[38] <= dout[39];
            dout[39] <= dout[40];
            dout[40] <= dout[41];
            dout[41] <= dout[42];
            dout[42] <= dout[43];
            dout[43] <= dout[44];
            dout[44] <= dout[45];
            dout[45] <= dout[46];
            dout[46] <= dout[47];
            dout[47] <= dout[48];
            dout[48] <= dout[49];
            dout[49] <= dout[50];
            dout[50] <= dout[51];
            dout[51] <= dout[52];
            dout[52] <= dout[53];
            dout[53] <= dout[54];
            dout[54] <= dout[55];
            dout[55] <= dout[56];
            dout[56] <= dout[57];
            dout[57] <= dout[58];
            dout[58] <= dout[59];
            dout[59] <= dout[60];
            dout[60] <= dout[61];
            dout[61] <= dout[62];
            dout[62] <= dout[63];
            dout[63] <= new_bit;
        end
    end
//add your code here
endmodule
