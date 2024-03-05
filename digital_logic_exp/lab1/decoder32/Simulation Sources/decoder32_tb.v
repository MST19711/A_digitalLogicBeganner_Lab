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


module compare32_tb(    );
    wire [4:0] IN;
    wire [31:0] OUT;
    reg [4:0] IN_reg; 
    assign IN = IN_reg;
    integer i;
    decoder32 dec32_test (
        .INPUT(IN),
        .OUTPUT(OUT)
    );
    initial begin
        $dumpfile("compare32_tb_wave.vcd");
        $dumpvars(0, compare32_tb);
        for(i = 0; i < 32; i = i + 1)begin
            IN_reg = i;
            #50;
        end
        $stop;
    end

endmodule
