`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 22:02:27
// Design Name: 
// Module Name: Adder32_tb
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


module chose_2to1_tb(    );
    reg a, b, c;
    wire wa, wb, wc, wo;
    assign wa = a;
    assign wb = b;
    assign wc = c;
    chose_2to1 test(wa, wb, wc ,wo);
    initial begin
        $dumpfile("chose_2to1_tb.vcd");
        $dumpvars(0, chose_2to1_tb);
        a = 0;
        b = 1;
        c = 0;
        #2;
        a = 1;
        b = 1;
        c = 0;
        #2;
        a = 1;
        b = 0;
        c = 0;
        #2;
        a = 0;
        b = 0;
        c = 0;
        #2
        a = 0;
        b = 1;
        c = 1;
        #2;
        a = 1;
        b = 1;
        c = 1;
        #2;
        a = 1;
        b = 0;
        c = 1;
        #2;
        a = 0;
        b = 0;
        c = 1;
    end

endmodule
