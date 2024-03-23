`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/02 11:14:03
// Design Name: 
// Module Name: mul_32b
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


module mul_32b(
    output [63:0] p,         //乘积
    output out_valid,        //高电平有效时，表示乘法器结束工作
    input clk,              //时钟 
    input rst_n,             //复位信号，低有效
    input [31:0] x,           //被乘数
    input [31:0] y,           //乘数
    input in_valid           //高电平有效，表示乘法器开始工作
); 
//add your code here
    reg [5:0] cn; //移位次数寄存器
    always @(posedge clk or posedge rst_n) begin
        if (rst_n) cn <= 0;
        else if (in_valid) cn <= 32;
        else if (cn != 0) cn <= cn - 1;
    end
    reg [31:0] rx, rp; //加法器操作数和部分积
    reg [32:0] ry;
    wire [31:0] Add_result; //加法运算结果
    wire cout; //进位
    // adder32 是32 位加法器模块的实例化，参见实验 3 的设计
    wire is_sub;
    assign is_sub = ry[1];
    Adder32 my_adder(.f(Add_result),.cout(cout),.x(rp),.y((ry[0] ^ ry[1]) ? rx : 0),.sub(is_sub));
    always @(posedge clk or posedge rst_n) begin
        if (rst_n) {rp, ry, rx} <= 0;
        else if (in_valid) {rp, ry, rx} <= {32'b0, y, 1'b0, x};
        else if (cn != 0) {rp, ry} <= ({Add_result[31], Add_result, ry[32:1]});
    end
    assign out_valid = (cn == 0);
    assign p = {x[31] ^ y[31], rp[30:0], ry[32:1]};
endmodule
