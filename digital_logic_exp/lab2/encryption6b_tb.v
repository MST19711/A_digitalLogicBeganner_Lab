`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 16:34:51
// Design Name: 
// Module Name: encryption6b_tb
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


module encryption6b_tb(    );
// add your code

    wire [7:0] dataout;
    wire ready_w;
    wire [5:0] key_w;
    reg [5:0] key;
    assign key_w = key;
    wire clk_w;
    reg clk;
    assign clk_w = clk;
    wire load_w;
    reg load;
    assign load_w = load;
    wire [7:0] datain_w;
    reg [7:0] datain;
    assign datain_w = datain;

    encryption6b encryption6b_test(
        .dataout(dataout),
        .ready(ready_w),
        .key(key_w),
        .clk(clk_w),
        .load(load_w),
        .datain(datain_w)
    );
    integer i;
    initial begin
        $dumpfile("encryption6b_tb.vcd");
        $dumpvars(0, encryption6b_tb);
        clk = 0;
        load = 0;
        datain = 8'b10101010;
        key = 8'b10010100;
        for(i = 0; i < 40; i = i + 1)begin
            clk = ~clk;
            #2;
        end
        clk = 0;
        load = 1;
        #2;
        clk = 1;
        #2;
        clk = 0;
        #2;
        clk = 1;
        #2;
        clk = 0;
        #2;
        load = 0;
        #2;
        for(i = 0; i < 40; i = i + 1)begin
            clk = ~clk;
            #2;
        end
    end
endmodule
