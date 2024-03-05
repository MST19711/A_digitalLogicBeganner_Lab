`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 20:14:55
// Design Name: 
// Module Name: trans4to4
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

module decoder32(
        input [4:0] INPUT,
        output [31:0] OUTPUT
    );
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign OUTPUT[i] = (INPUT == i);
        end
    endgenerate
endmodule 