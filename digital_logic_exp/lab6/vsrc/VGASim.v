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
    output [31:0] ram_addr,
    input CLK,        //ϵͳʱ���ź�
    input  BTNC,           // ��λ�ź�
    output [3:0] VGA_R,    //��ɫ�ź�ֵ
    output [3:0] VGA_G,    //��ɫ�ź�ֵ
    output [3:0] VGA_B,     //��ɫ�ź�ֵ
    output  VGA_HS,         //��ͬ���ź�
    output  VGA_VS,          //֡ͬ���ź�
    output VALID,
    input [11:0] vramd_read
 );
wire [11:0] vga_data;
wire valid;
wire [11:0] h_addr;
wire [11:0] v_addr;
assign VALID = valid;
assign ram_addr = (v_addr * 640) + {20'd0, h_addr};
assign vga_data = vramd_read;
VGACtrl vgactrl(.pix_x(h_addr),.pix_y(v_addr),.hsync(VGA_HS),.vsync(VGA_VS),.pix_valid(valid),.pix_clk(CLK),.pix_rst(BTNC));
assign VGA_R = (valid == 1'b1) ? vga_data[11:8] : 4'b0000;
assign VGA_G = (valid == 1'b1) ? vga_data[7:4] : 4'b0000;
assign VGA_B = (valid == 1'b1) ? vga_data[3:0] : 4'b0000;
endmodule
