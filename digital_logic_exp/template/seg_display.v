`timescale 1ns / 1ps

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
module decoder_seg(
                input [3:0] I,
                output [6:0] seg
            );
    assign seg[0] = `seg_1 | `seg_4 | `seg_B | `seg_D ;
    assign seg[1] = `seg_5 | `seg_6 | `seg_B | `seg_C | `seg_E | `seg_F;
    assign seg[2] = `seg_2 | `seg_C | `seg_E | `seg_F;
    assign seg[3] = `seg_1 | `seg_4 | `seg_7 | `seg_A | `seg_F;
    assign seg[4] = `seg_1 | `seg_3 | `seg_4 | `seg_5 | `seg_7 | `seg_9;
    assign seg[5] = `seg_1 | `seg_2 | `seg_3 | `seg_7 | `seg_D;
    assign seg[6] = `seg_0 | `seg_1 | `seg_7 | `seg_C;
endmodule

module decoder_3to8(
            input [2:0] INPUT,
            output [7:0] OUT
        );
    wire [3:0] I;
    assign I = {INPUT[0], INPUT[1], INPUT[2], 1'b0};
    assign OUT[0] = ~`seg_0;
    assign OUT[1] = ~`seg_1;
    assign OUT[2] = ~`seg_2;
    assign OUT[3] = ~`seg_3;
    assign OUT[4] = ~`seg_4;
    assign OUT[5] = ~`seg_5;
    assign OUT[6] = ~`seg_6;
    assign OUT[7] = ~`seg_7;
endmodule

module chose8to1_1(
        input I0,
        input I1,
        input I2,
        input I3,
        input I4,
        input I5,
        input I6,
        input I7,
        output OUT,
        input [2:0] chose_sig
    );
    assign OUT = (chose_sig == 0 & I0) |
            (chose_sig == 1 & I1) | 
            (chose_sig == 2 & I2) | 
            (chose_sig == 3 & I3) | 
            (chose_sig == 4 & I4) | 
            (chose_sig == 5 & I5) | 
            (chose_sig == 6 & I6) | 
            (chose_sig == 7 & I7);
endmodule
module chose8to1(
        input [3:0] I0,
        input [3:0] I1,
        input [3:0] I2,
        input [3:0] I3,
        input [3:0] I4,
        input [3:0] I5,
        input [3:0] I6,
        input [3:0] I7,
        output [3:0] OUT,
        input [2:0] C
    );
    genvar i;
    generate
        for(i = 0; i <= 3; i = i + 1)begin
            chose8to1_1 chose_blk(
                .I0(I0[i]),
                .I1(I1[i]),
                .I2(I2[i]),
                .I3(I3[i]),
                .I4(I4[i]),
                .I5(I5[i]),
                .I6(I6[i]),
                .I7(I7[i]),
                .OUT(OUT[3 - i]),
                .chose_sig(C)
            );
        end
    endgenerate
endmodule
 
module seg_display(
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    input [3:0] I4,
    input [3:0] I5,
    input [3:0] I6,
    input [3:0] I7,
    input clk,
    output [6:0] segs,           
    output [7:0] AN
);
    reg [31:0] counter = 31'd0;
    reg [2:0] c_REG;
    decoder_3to8 dec38_0(
        .INPUT(c_REG),
        .OUT(AN)
    );
    wire [3:0] input2decoder;
    chose8to1 choser_0(
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .OUT(input2decoder),
        .C(c_REG)
    );
    decoder_seg seg_0(
        .I(c_REG),
        .seg(segs)
    );
    always@(posedge clk) begin : main
        counter <= counter + 1;
        c_REG <= (counter/10000) % 8;
        if(counter == 99999999)begin
           counter <= 0;
        end
    end
endmodule