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

module add_unit(
    input A,
    input B,
    input CIN,
    output OUT,
    output COUT
);
    assign OUT = (A ^ B) ^ CIN;
    assign COUT = (A & B) | (A & CIN) | (B & CIN);
endmodule

module add_32(
    input [31:0] A,
    input [31:0] B,
    input CIN,
    output [31:0] OUT,
    output COUT
);
    wire [31:0] C;
    genvar i;
    generate
        for(i = 0; i <= 31 ; i = i + 1)begin : gen_add
            add_unit add1(
                .A(A[i]),
                .B(B[i]),
                .CIN((i == 0) ? CIN : C[i-1]),
                .OUT(OUT[i]),
                .COUT(C[i])
            );
        end
    endgenerate
    assign COUT = C[31];
endmodule

module cmp32(
    input [31:0] A,
    input [31:0] B,
    output GE
);
    wire [31:0] ADD_OUT;
    wire COUT;
    add_32 AmB(
        .A(A),
        .B(B),
        .CIN(1'b1),
        .OUT(ADD_OUT),
        .COUT(COUT)
    );
    assign GE = 1 ^ COUT;
endmodule
