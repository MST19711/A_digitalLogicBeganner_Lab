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


module DigitalTimer(  //端口声明
  input clk,
  input rst,            //复位，有效后00:00:00
  input [1:0] s,        // =00时，进入技术；01：设置小时；10：设置分钟；11：设置秒
  input [3:0] data_h,   //设置初值高位，使用BCD码表示
  input [3:0] data_l,   //设置初值低位，使用BCD码表示
  output [6:0] segs,   //七段数码管输入值，显示数字
  output [7:0] an,     //七段数码管控制位，控制时、分、秒 
  output [2:0] ledout   //输出3色指示灯
); 
// Add your code

endmodule


