`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 21:27:45
// Design Name: 
// Module Name: hamming7check
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

`define seg_0 (~I[0]&~I[1]&~I[2]&~I[3])
`define seg_1 (~I[0]&~I[1]&~I[2]&I[3])
`define seg_2 (~I[0]&~I[1]&I[2]&~I[3])
`define seg_3 (~I[0]&~I[1]&I[2]&I[3])
`define seg_4 (~I[0]&I[1]&~I[2]&~I[3])
`define seg_5 (~I[0]&I[1]&~I[2]&I[3])
`define seg_6 (~I[0]&I[1]&I[2]&~I[3])
`define seg_7 (~I[0]&I[1]&I[2]&I[3])
`define seg_8 (I[0]&~I[1]&~I[2]&~I[3])
`define seg_9 (I[0]&~I[1]&~I[2]&I[3])
`define seg_A (I[0]&~I[1]&I[2]&~I[3])
`define seg_B (I[0]&~I[1]&I[2]&I[3])
`define seg_C (I[0]&I[1]&~I[2]&~I[3])
`define seg_D (I[0]&I[1]&~I[2]&I[3])
`define seg_E (I[0]&I[1]&I[2]&~I[3])
`define seg_F (I[0]&I[1]&I[2]&I[3])

module decoder_4to16(
   input [3:0]I, 
   output [15:1]OUT
);
   assign OUT[1] = `seg_1;
   assign OUT[2] = `seg_2;
   assign OUT[3] = `seg_3;
   assign OUT[4] = `seg_4;
   assign OUT[5] = `seg_5;
   assign OUT[6] = `seg_6;
   assign OUT[7] = `seg_7;
   assign OUT[8] = `seg_8;
   assign OUT[9] = `seg_9;
   assign OUT[10] = `seg_A;
   assign OUT[11] = `seg_B;
   assign OUT[12] = `seg_C;
   assign OUT[13] = `seg_D;
   assign OUT[14] = `seg_E;
   assign OUT[15] = `seg_F;
endmodule

module decoder_seg(
                input [3:0] I,
                output [6:0] seg
            );
    assign seg[0] = `seg_1 | `seg_4 | `seg_B | `seg_D;
    assign seg[1] = `seg_5 | `seg_6 | `seg_B | `seg_C | `seg_E | `seg_F;
    assign seg[2] = `seg_2 | `seg_C | `seg_E | `seg_F;
    assign seg[3] = `seg_1 | `seg_4 | `seg_7 | `seg_A | `seg_F;
    assign seg[4] = `seg_1 | `seg_3 | `seg_4 | `seg_5 | `seg_7 | `seg_9;
    assign seg[5] = `seg_1 | `seg_2 | `seg_3 | `seg_7 | `seg_D;
    assign seg[6] = `seg_0 | `seg_1 | `seg_7 | `seg_C;
endmodule

module hamming16check(
output reg [15:1] DC,//�������? 7 λ��ȷ�Ľ��?
output reg NOERROR,//У������ȷ��־λ
output reg [6:0] O_seg,//7 ������
output reg [7:0] O_led,//�����ѡ��?
input [15:1] DU//���� 7 λ������
);
// add your code here
   wire [4:1] ham_res;
   wire [15:1] error_LED;
   wire [6:0] seg_led;
   assign ham_res[1] = DU[1] ^ DU[3] ^ DU[5] ^ DU[7] ^ DU[9] ^ DU[11] ^ DU[13] ^ DU[15];
   assign ham_res[2] = DU[2] ^ DU[3] ^ DU[6] ^ DU[7] ^ DU[10] ^ DU[11] ^ DU[14] ^ DU[15];
   assign ham_res[3] = DU[4] ^ DU[5] ^ DU[6] ^ DU[7] ^ DU[12] ^ DU[13] ^ DU[14] ^ DU[15];
   assign ham_res[4] = DU[8] ^ DU[9] ^ DU[10] ^ DU[11] ^ DU[12] ^ DU[13] ^ DU[14] ^ DU[15];
   decoder_4to16 dec0(
      .I(ham_res),
      .OUT(error_LED)
   );
   decoder_seg dec1(
      .I(ERR_adr),
      .seg(seg_led)
   );
   always@(*) begin
      NOERROR = (ham_res == 4'b0000) ? 1 : 0;
      O_led = 8'b01111111;
      DC = DU ^ error_LED;
      O_seg = seg_led;
   end

endmodule