`timescale 1ns / 1ps


module BCD2INT(
    input [3:0] data_h,//设置参数高位，使用 BCD 码表示
    input [3:0] data_l,//设置参数低位，使用 BCD 码表示
    output [6:0] data_out
);
    assign data_out = 10 * ((data_h > 9) ? 9 : data_h) + ((data_l > 9) ? 9 : data_l);
endmodule