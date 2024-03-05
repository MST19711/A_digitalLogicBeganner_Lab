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
endmodule

module lfsr(              //64位线性移位寄存器
	output reg [63:0] dout,
    input  [63:0]  seed,
	input  clk,
	input  load
	);
//add your code here
endmodule
