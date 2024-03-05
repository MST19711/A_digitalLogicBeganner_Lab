`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 20:16:00
// Design Name: 
// Module Name: trans4to4_tb
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


module compare32_tb();
    wire [31:0] A_in, B_in;
    wire GE;
    reg [31:0] A, B; 
    assign A_in = A, B_in = B;
    integer i;
    cmp32 test_cmp32 (
        .A(A_in),
        .B(B_in),
        .GE(GE)
    );
    initial begin
        $dumpfile("compare32_tb_wave.vcd");
        $dumpvars(0, compare32_tb);
        for(i = 0; i < 256; i = i + 1)begin
            A=$urandom;
            B=$urandom;
            #50;
        end
        $stop;
    end

endmodule
