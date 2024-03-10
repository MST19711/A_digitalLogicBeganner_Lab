`timescale 1ns / 1ps


module BCD2INT_tb(); 
    reg [3:0] reg_h;
    reg [3:0] reg_l;
    wire [3:0] data_h;//设置参数高位，使用 BCD 码表示
    wire [3:0] data_l;//设置参数低位，使用 BCD 码表示
    wire [6:0] data_out;
    assign data_h = reg_h;
    assign data_l = reg_l;
    BCD2INT BCD2INT_test(
        .data_h(data_h),
        .data_l(data_l),
        .data_out(data_out)
    );
    integer i, j;
    initial begin
        $dumpfile("BCD2INT_tb.vcd");
        $dumpvars(0, BCD2INT_tb);
        for(i = 0; i < 4'b1111; i = i + 1)begin
            for(j = 0; j < 4'b1111; j = j + 1)begin
                reg_h = i;
                reg_l = j;
                #50;
            end
        end
    end
endmodule