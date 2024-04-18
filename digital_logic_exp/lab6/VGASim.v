`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 09:57:44
// Design Name: 
// Module Name: VGASim
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


module VGASim(
    input CLK100MHZ,        //????????
    input  BTNC,           // ??¦Ë???
    output [3:0] VGA_R,    //???????
    output [3:0] VGA_G,    //???????
    output [3:0] VGA_B,     //???????
    output  VGA_HS,         //????????
    output  VGA_VS,         //???????
 );
wire [11:0] vga_data;
wire valid;
wire [11:0] h_addr;
wire [11:0] v_addr;


VGACtrl vgactrl(.pix_x(h_addr),.pix_y(v_addr),.hsync(VGA_HS),.vsync(VGA_VS),.pix_valid(valid),.pix_clk(CLK100MHZ),.pix_rst(BTNC));
VGADraw vgadraw(.pix_data(vga_data),.pix_x(h_addr),.pix_y(v_addr),.pix_valid(valid),.pix_clk(CLK100MHZ));
assign VGA_R=vga_data[11:8];
assign VGA_G=vga_data[7:4];
assign VGA_B=vga_data[3:0];
endmodule
