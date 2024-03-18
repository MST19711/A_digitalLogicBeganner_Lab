`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 22:03:44
// Design Name: 
// Module Name: ALU32_top
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


module ALU32_top(
output [6:0] segs,           
output [7:0] AN,            
output  [15:0] result_l,       
output  zero,            
input   [3:0] data_a,          
input   [3:0] data_b,     
input   [3:0] aluctr,    
input   clk
); 
//add your code here
    wire [31:0] ALU_result;
    ALU32 ALU_0(
        .result(ALU_result),     
        .zero(zero),              
        .dataa({data_a, data_a, data_a, data_a, data_a, data_a, data_a, data_a}),     
        .datab({data_b, data_b, data_b, data_b, data_b, data_b, data_b, data_b}),      
        .aluctr(aluctr)       
    ); 
    assign result_l = ALU_result[15:0];
    seg_display seg0(
        .I0(ALU_result[31:28]),
        .I1(ALU_result[27:24]),
        .I2(ALU_result[23:20]),
        .I3(ALU_result[19:16]),
        .I4(ALU_result[15:12]),
        .I5(ALU_result[11:8]),
        .I6(ALU_result[7:4]),
        .I7(ALU_result[3:0]),
        .clk(clk),
        .segs(segs),           
        .AN(AN)  
    );
endmodule
