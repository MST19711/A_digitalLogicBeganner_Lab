`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/14 23:25:20
// Design Name: 
// Module Name: VGADraw
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


module VGADraw(
    output [31:0] ram_addr,
    input   wire            pix_clk  ,
    input   wire    [11:0]   pix_x  ,
    input   wire    [11:0]   pix_y  ,
    input   wire            pix_valid ,    
    output  wire     [11:0]  pix_data ,
    input [11:0] vramd_read
);

reg [27:0] cntdyn;
reg [7:0] temp_r,temp_g,temp_b,temp_d;


// verilator lint_off WIDTHEXPAND
// verilator lint_off WIDTHTRUNC


wire [27:0] shifted_value = cntdyn >> 20;
wire [7:0] shifted_value_07, r7, g7, b7;
assign shifted_value_07 = shifted_value[7:0];
/*
always@(posedge pix_clk )begin
    //cntdyn<=cntdyn+1;
    temp_d <= shifted_value_07;
    temp_r <= -pix_x-pix_y-temp_d;
    temp_g <= pix_x-temp_d;
    temp_b <= pix_y-temp_d;
end
*/
assign ram_addr = (pix_y * 640) + pix_x;
assign pix_data = vramd_read;//(pix_x > 300 & ((pix_y >> 4) & 1)) ? 4'hF : 4'h0;//-pix_x-pix_y-shifted_value_07;//temp_r[7:4];
//assign  pix_data[7:4] = //(pix_x > 300 & ((pix_y >> 4) & 1)) ? 4'hF : 4'h0;//pix_x-temp_d;//temp_g[7:4];
//assign  pix_data[3:0] = //(pix_x > 300 & ((pix_y >> 4) & 1)) ? 4'hF : 4'h0;//pix_y-temp_d;//temp_b[7:4];

// verilator lint_on WIDTHEXPAND
// verilator lint_on WIDTHTRUNC
endmodule
